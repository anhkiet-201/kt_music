// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiscoverController on _DiscoverControllerBase, Store {
  late final _$_selectedOptionAtom =
      Atom(name: '_DiscoverControllerBase._selectedOption', context: context);

  TopbarOption get selectedOption {
    _$_selectedOptionAtom.reportRead();
    return super._selectedOption;
  }

  @override
  TopbarOption get _selectedOption => selectedOption;

  @override
  set _selectedOption(TopbarOption value) {
    _$_selectedOptionAtom.reportWrite(value, super._selectedOption, () {
      super._selectedOption = value;
    });
  }

  late final _$_DiscoverControllerBaseActionController =
      ActionController(name: '_DiscoverControllerBase', context: context);

  @override
  void selectOption(TopbarOption option) {
    final _$actionInfo = _$_DiscoverControllerBaseActionController.startAction(
        name: '_DiscoverControllerBase.selectOption');
    try {
      return super.selectOption(option);
    } finally {
      _$_DiscoverControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
