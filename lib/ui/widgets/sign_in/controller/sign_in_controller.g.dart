// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInController on _SignInControllerBase, Store {
  late final _$_shoudShowPasswordAtom =
      Atom(name: '_SignInControllerBase._shoudShowPassword', context: context);

  bool get shoudShowPassword {
    _$_shoudShowPasswordAtom.reportRead();
    return super._shoudShowPassword;
  }

  @override
  bool get _shoudShowPassword => shoudShowPassword;

  @override
  set _shoudShowPassword(bool value) {
    _$_shoudShowPasswordAtom.reportWrite(value, super._shoudShowPassword, () {
      super._shoudShowPassword = value;
    });
  }

  late final _$_shoudShowLoginButtonAtom = Atom(
      name: '_SignInControllerBase._shoudShowLoginButton', context: context);

  bool get shoudShowLoginButton {
    _$_shoudShowLoginButtonAtom.reportRead();
    return super._shoudShowLoginButton;
  }

  @override
  bool get _shoudShowLoginButton => shoudShowLoginButton;

  @override
  set _shoudShowLoginButton(bool value) {
    _$_shoudShowLoginButtonAtom.reportWrite(value, super._shoudShowLoginButton,
        () {
      super._shoudShowLoginButton = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_SignInControllerBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_emailValidationAtom =
      Atom(name: '_SignInControllerBase._emailValidation', context: context);

  String get emailValidation {
    _$_emailValidationAtom.reportRead();
    return super._emailValidation;
  }

  @override
  String get _emailValidation => emailValidation;

  @override
  set _emailValidation(String value) {
    _$_emailValidationAtom.reportWrite(value, super._emailValidation, () {
      super._emailValidation = value;
    });
  }

  late final _$_passwordValidationAtom =
      Atom(name: '_SignInControllerBase._passwordValidation', context: context);

  String get passwordValidation {
    _$_passwordValidationAtom.reportRead();
    return super._passwordValidation;
  }

  @override
  String get _passwordValidation => passwordValidation;

  @override
  set _passwordValidation(String value) {
    _$_passwordValidationAtom.reportWrite(value, super._passwordValidation, () {
      super._passwordValidation = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_SignInControllerBase.signIn', context: context);

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$_SignInControllerBaseActionController =
      ActionController(name: '_SignInControllerBase', context: context);

  @override
  void showOrHidePassword() {
    final _$actionInfo = _$_SignInControllerBaseActionController.startAction(
        name: '_SignInControllerBase.showOrHidePassword');
    try {
      return super.showOrHidePassword();
    } finally {
      _$_SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _listen() {
    final _$actionInfo = _$_SignInControllerBaseActionController.startAction(
        name: '_SignInControllerBase._listen');
    try {
      return super._listen();
    } finally {
      _$_SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _checkShowButton() {
    final _$actionInfo = _$_SignInControllerBaseActionController.startAction(
        name: '_SignInControllerBase._checkShowButton');
    try {
      return super._checkShowButton();
    } finally {
      _$_SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
