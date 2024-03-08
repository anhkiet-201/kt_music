// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$_isLoginedAtom =
      Atom(name: '_AuthControllerBase._isLogined', context: context);

  bool get isLogined {
    _$_isLoginedAtom.reportRead();
    return super._isLogined;
  }

  @override
  bool get _isLogined => isLogined;

  @override
  set _isLogined(bool value) {
    _$_isLoginedAtom.reportWrite(value, super._isLogined, () {
      super._isLogined = value;
    });
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.signInWithGoogle', context: context);

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthControllerBase.signInWithEmailAndPassword',
      context: context);

  @override
  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _$signInWithEmailAndPasswordAsyncAction.run(() =>
        super.signInWithEmailAndPassword(email: email, password: password));
  }

  late final _$_handleSignInAsyncAction =
      AsyncAction('_AuthControllerBase._handleSignIn', context: context);

  @override
  Future<void> _handleSignIn() {
    return _$_handleSignInAsyncAction.run(() => super._handleSignIn());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthControllerBase.logout', context: context);

  @override
  Future<void> logout({bool allDevices = false}) {
    return _$logoutAsyncAction.run(() => super.logout(allDevices: allDevices));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
