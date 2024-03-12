// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_email_reset_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InputEmailResetController on _InputEmailResetControllerBase, Store {
  Computed<bool>? _$shouldShowButtonComputed;

  @override
  bool get shouldShowButton => (_$shouldShowButtonComputed ??= Computed<bool>(
          () => super.shouldShowButton,
          name: '_InputEmailResetControllerBase.shouldShowButton'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_InputEmailResetControllerBase._isLoading', context: context);

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

  late final _$_validationAtom = Atom(
      name: '_InputEmailResetControllerBase._validation', context: context);

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

  late final _$_initializeAsyncAction = AsyncAction(
      '_InputEmailResetControllerBase._initialize',
      context: context);

  @override
  Future<void> _initialize() {
    return _$_initializeAsyncAction.run(() => super._initialize());
  }

  late final _$sendEmailResetAsyncAction = AsyncAction(
      '_InputEmailResetControllerBase.sendEmailReset',
      context: context);

  @override
  Future<void> sendEmailReset() {
    return _$sendEmailResetAsyncAction.run(() => super.sendEmailReset());
  }

  @override
  String toString() {
    return '''
shouldShowButton: ${shouldShowButton}
    ''';
  }
}
