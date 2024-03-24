import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'player_controller.g.dart';

class PlayerController = _PlayerControllerBase with _$PlayerController;

abstract class _PlayerControllerBase extends BaseController with Store, AuthControllerProvider {

  final AudioPlayer _player;

  _PlayerControllerBase() : _player = AudioPlayer() {
    _initialize();
  }

  _initialize() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    
  }

  play({required List<AudioSource> playlist}) async {
    await _player.setAudioSource(ConcatenatingAudioSource(children: playlist));
    _player.play();
  }

  @override
  FutureOr onDispose() {
    _player.dispose();
  }
}