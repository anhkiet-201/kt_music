// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetPasswordController on _ResetPasswordControllerBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_ResetPasswordControllerBase._isLoading', context: context);

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

  late final _$_emailAtom =
      Atom(name: '_ResetPasswordControllerBase._email', context: context);

  String? get email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  String? get _email => email;

  @override
  set _email(String? value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_validationAtom =
      Atom(name: '_ResetPasswordControllerBase._validation', context: context);

  String get validation {
    _$_validationAtom.reportRead();
    return super._validation;
  }

  @override
  String get _validation => validation;

  @override
  set _validation(String value) {
    _$_validationAtom.reportWrite(value, super._validation, () {
      super._validation = value;
    });
  }

  late final _$_shoudShowPasswordAtom = Atom(
      name: '_ResetPasswordControllerBase._shoudShowPassword',
      context: context);

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

  late final _$_initializeAsyncAction =
      AsyncAction('_ResetPasswordControllerBase._initialize', context: context);

  @override
  Future<void> _initialize() {
    return _$_initializeAsyncAction.run(() => super._initialize());
  }

  late final _$setNewPasswordAsyncAction = AsyncAction(
      '_ResetPasswordControllerBase.setNewPassword',
      context: context);

  @override
  Future<void> setNewPassword() {
    return _$setNewPasswordAsyncAction.run(() => super.setNewPassword());
  }

  late final _$_ResetPasswordControllerBaseActionController =
      ActionController(name: '_ResetPasswordControllerBase', context: context);

  @override
  void showOrHidePassword() {
    final _$actionInfo = _$_ResetPasswordControllerBaseActionController
        .startAction(name: '_ResetPasswordControllerBase.showOrHidePassword');
    try {
      return super.showOrHidePassword();
    } finally {
      _$_ResetPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
