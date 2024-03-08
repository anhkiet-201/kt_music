// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerBase, Store {
  late final _$_shoudShowPasswordAtom =
      Atom(name: '_SignUpControllerBase._shoudShowPassword', context: context);

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

  late final _$_selectedGenderAtom =
      Atom(name: '_SignUpControllerBase._selectedGender', context: context);

  SGender? get selectedGender {
    _$_selectedGenderAtom.reportRead();
    return super._selectedGender;
  }

  @override
  SGender? get _selectedGender => selectedGender;

  @override
  set _selectedGender(SGender? value) {
    _$_selectedGenderAtom.reportWrite(value, super._selectedGender, () {
      super._selectedGender = value;
    });
  }

  late final _$_stepAtom =
      Atom(name: '_SignUpControllerBase._step', context: context);

  int get step {
    _$_stepAtom.reportRead();
    return super._step;
  }

  @override
  int get _step => step;

  @override
  set _step(int value) {
    _$_stepAtom.reportWrite(value, super._step, () {
      super._step = value;
    });
  }

  late final _$_SignUpControllerBaseActionController =
      ActionController(name: '_SignUpControllerBase', context: context);

  @override
  void _listen() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase._listen');
    try {
      return super._listen();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _validation() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase._validation');
    try {
      return super._validation();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showOrHidePassword() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.showOrHidePassword');
    try {
      return super.showOrHidePassword();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectGender(SGender gender) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.selectGender');
    try {
      return super.selectGender(gender);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
