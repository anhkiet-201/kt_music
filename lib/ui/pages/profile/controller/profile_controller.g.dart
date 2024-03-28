// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileControllerBase, Store {
  Computed<User?>? _$userComputed;

  @override
  User? get user => (_$userComputed ??= Computed<User?>(() => super.user,
          name: '_ProfileControllerBase.user'))
      .value;

  late final _$_appBarBackgroundProgressAtom = Atom(
      name: '_ProfileControllerBase._appBarBackgroundProgress',
      context: context);

  double get appBarBackgroundProgress {
    _$_appBarBackgroundProgressAtom.reportRead();
    return super._appBarBackgroundProgress;
  }

  @override
  double get _appBarBackgroundProgress => appBarBackgroundProgress;

  @override
  set _appBarBackgroundProgress(double value) {
    _$_appBarBackgroundProgressAtom
        .reportWrite(value, super._appBarBackgroundProgress, () {
      super._appBarBackgroundProgress = value;
    });
  }

  late final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase', context: context);

  @override
  void _listenScroll() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase._listenScroll');
    try {
      return super._listenScroll();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
