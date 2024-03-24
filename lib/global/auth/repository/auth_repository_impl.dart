import 'dart:async';

import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';

class AuthRepositoryImpl
    with FirebaseAuthProvider, FirebaseFireStoreProvider
    implements AuthRepository {

  @override
  Future<bool> signIn(LoginMethodProvider loginMethodProvider) async {
    try {
      if (loginMethodProvider is EmailAndPasswordLoginProvider) {
        await auth.sign(
            email: loginMethodProvider.email,
            password: loginMethodProvider.password);
      } else if (loginMethodProvider is GoogleLoginProvider) {
        await auth.signWithGoogle();
      }
    } catch (e) {
      await auth.signOut();
      rethrow;
    }
    return true;
  }

  @override
  Future<bool> signOut() async {
    await auth.signOut();
    return true;
  }

  @override
  bool get isLogined => auth.currentUser != null;

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String name,
      required int age,
      required String gender}) async {
    final f_user = await auth.signUp(
        email: email, password: password, name: name, age: age, gender: gender);
    if (f_user == null) return false;
    await fireStore.addUser(
      User(
        email: f_user.email ?? '',
        name: f_user.displayName ?? '',
        uuid: f_user.uid,
        avatar: f_user.photoURL,
      ),
    );
    return true;
  }

  @override
  Future<void> sync() async {
    if (auth.currentUser == null) {
      _user = null;
      return;
    }
    log.i('Start sync data');
    final user = await fireStore.getUserByUID(auth.currentUser?.uid ?? '');
    _user = user?.copyWith(
          avatar: user.avatar ?? auth.currentUser?.photoURL,
        ) ??
        User(
          uuid: auth.currentUser?.uid ?? '',
          email: auth.currentUser?.email ?? '',
          name: auth.currentUser?.displayName ?? auth.currentUser?.email ?? '',
          avatar: auth.currentUser?.photoURL,
        );
    log.i('Sync data done!');
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await auth.resetPassword(email: email);
  }

  @override
  Future<String?> getEmailFromOobCode(String code) async {
    return await auth.checkObbCode(code: code);
  }

  @override
  Future<void> updatePassword(
      {required String code, required String newPassword}) async {
    await auth.confirmNewPassword(oobCode: code, newPassword: newPassword);
  }

  User? _user;
  @override
  User? get user => _user;
}
