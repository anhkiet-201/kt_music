import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage_provider.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController
    with
        Store,
        AuthRepositoryProvider,
        TabBarControllerProvider,
        LocalStorageProvider {
  final StreamController<User?> onUserChange = StreamController.broadcast();

  _AuthControllerBase() {
    onUserChange.stream.listen((event) {
      if (event != null) {
        nav.toHome();
        log.d('Login with: ${event.toJson()}');
      } else {
        nav.toOnBoading();
        log.d('Not login!');
      }
    });
    // authRepository.onUserDataChange.listen((event) {
    //   print('Debug 112 data change ${event?.toJson()}');
    // });
  }

  @computed
  bool get isLogined => _user != null;

  @readonly
  late User? _user = authRepository.user;

  @readonly
  bool _isSyncing = false;

  LoginMethodProvider? _loginMethodProvider;
  LoginMethodProvider? get loginMethod => _loginMethodProvider;

  @action
  Future<void> signInWithGoogle() async {
    try {
      _loginMethodProvider = GoogleLoginProvider();
    } catch (error) {
      log.e(error);
      nav.showSnackBar(error: error);
    }
    await _handleSignIn();
  }

  @action
  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _loginMethodProvider = EmailAndPasswordLoginProvider(
      email: email,
      password: password,
    );
    await _handleSignIn();
  }

  @action
  Future<void> _handleSignIn() async {
    try {
      if (_loginMethodProvider == null) {
        nav.showSnackBar(message: 'Login provider is not support!');
        return;
      }
      await authRepository.signIn(_loginMethodProvider!);
      log.d('Login successfull');
    } catch (error) {
      log.e(error);
      nav.showSnackBar(error: error);
      _loginMethodProvider = null;
    }
  }

  @action
  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required String age,
      required String gender}) async {
    try {
      await authRepository.signUp(
          email: email,
          password: password,
          name: name,
          age: int.tryParse(age) ?? 0,
          gender: gender);
    } catch (e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  @action
  Future<void> syncUser() async {
    _isSyncing = true;
    await authRepository.sync();
    _user = authRepository.user;
    _isSyncing = false;
    onUserChange.sink.add(_user);
  }

  @action
  Future<void> logout({bool allDevices = false}) async {
    try {
      log.d('Start logout');
      await authRepository.signOut();
      tabbarController.reset();
    } catch (e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  Future<void> sendEmailReset({String? email}) async {
    try {
      log.d('Send email reset password');
      await authRepository.resetPassword(email: email ?? _user?.email ?? '');
    } catch (e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  Future<String?> getEmailReset({String? code}) async {
    if (code == null) return _user?.email;
    try {
      return await authRepository.getEmailFromOobCode(code);
    } catch (e) {
      log.e(e);
      nav.showSnackBar(error: e);
      rethrow;
    }
  }

  Future<void> confirmNewPassword(
      {required String code, required String newPassword}) async {
    try {
      log.d('Reset new password');
      await authRepository.updatePassword(
        code: code,
        newPassword: newPassword,
      );
    } catch (e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  @override
  FutureOr onDispose() {}
}
