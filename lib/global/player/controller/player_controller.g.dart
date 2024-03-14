// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerController on _PlayerControllerBase, Store {
  Computed<PlayState>? _$playStateComputed;

  @override
  PlayState get playState =>
      (_$playStateComputed ??= Computed<PlayState>(() => super.playState,
              name: '_PlayerControllerBase.playState'))
          .value;

  late final _$_playingAtom =
      Atom(name: '_PlayerControllerBase._playing', context: context);

  @override
  bool get _playing {
    _$_playingAtom.reportRead();
    return super._playing;
  }

  @override
  set _playing(bool value) {
    _$_playingAtom.reportWrite(value, super._playing, () {
      super._playing = value;
    });
  }

  late final _$_playingStateAtom =
      Atom(name: '_PlayerControllerBase._playingState', context: context);

  @override
  ProcessingState get _playingState {
    _$_playingStateAtom.reportRead();
    return super._playingState;
  }

  @override
  set _playingState(ProcessingState value) {
    _$_playingStateAtom.reportWrite(value, super._playingState, () {
      super._playingState = value;
    });
  }

  late final _$_PlayerControllerBaseActionController =
      ActionController(name: '_PlayerControllerBase', context: context);

  @override
  dynamic _playerEventListen() {
    final _$actionInfo = _$_PlayerControllerBaseActionController.startAction(
        name: '_PlayerControllerBase._playerEventListen');
    try {
      return super._playerEventListen();
    } finally {
      _$_PlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playState: ${playState}
    ''';
  }
}
