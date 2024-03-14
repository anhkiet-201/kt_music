// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicPlayerController on _MusicPlayerControllerBase, Store {
  late final _$_playPositionAtom =
      Atom(name: '_MusicPlayerControllerBase._playPosition', context: context);

  Duration? get playPosition {
    _$_playPositionAtom.reportRead();
    return super._playPosition;
  }

  @override
  Duration? get _playPosition => playPosition;

  @override
  set _playPosition(Duration? value) {
    _$_playPositionAtom.reportWrite(value, super._playPosition, () {
      super._playPosition = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
