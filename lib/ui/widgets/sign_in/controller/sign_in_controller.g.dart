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
  String toString() {
    return '''

    ''';
  }
}
