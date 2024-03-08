import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage_provider.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController
    with Store, AuthRepositoryProvider, 
    TabBarControllerProvider,
    LocalStorageProvider {

  @readonly
  late bool _isLogined = authRepository.isLogined;

  LoginMethodProvider? _loginMethodProvider;
  LoginMethodProvider? get loginMethod => _loginMethodProvider;

  @action
  Future<void> signInWithGoogle() async {
    try {
      _loginMethodProvider =
          GoogleLoginProvider();
    } catch (error) {
      log.e(error);
      nav.showSnackBar(error: error);
    }
    await _handleSignIn();
  }

  @action
  signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    _loginMethodProvider = EmailAndPasswordLoginProvider(
        email: email,
        password: password);
    await _handleSignIn();
  }

  @action
  Future<void> _handleSignIn() async {
    try {
      if(_loginMethodProvider == null) {
        nav.showSnackBar(message: 'Login provider is not support!');
        return;
      }
      await authRepository.signIn(_loginMethodProvider!);
      log.d('Login successfull');
    } catch(error) {
      log.e(error);
      nav.showSnackBar(error: error);
      _loginMethodProvider = null;
    }
  }

  @action
  Future<void> logout({bool allDevices = false}) async {
    try {
      log.d('Start logout');
      await authRepository.signOut();
      nav.toOnBoading();
    } catch(e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  @override
  FutureOr onDispose() {}
}
