import 'dart:async';

import 'package:just_audio/just_audio.dart';
// ignore: depend_on_referenced_packages
import 'package:audio_session/audio_session.dart' show AudioSession, AudioSessionConfiguration;
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'player_controller.g.dart';

class PlayerController = _PlayerControllerBase with _$PlayerController;

abstract class _PlayerControllerBase extends BaseController with Store {

  final AudioPlayer _player;

  Stream<Duration> get position => _player.positionStream;

  @observable
  bool _playing = false;

  Stream<Duration?> get duration => _player.durationStream;

  Stream<int?> get currentIndexAudio => _player.currentIndexStream;

  Stream<LoopMode> get loopMode => _player.loopModeStream;

  Stream<bool> get shuffle => _player.shuffleModeEnabledStream;

  List<AudioSource> get audioSources {
    final data = _player.audioSource;
    if(data == null) return [];
    return (data as ConcatenatingAudioSource).children;
  }

  @observable
  ProcessingState _playingState = ProcessingState.idle;

  bool get hasNext => _player.hasNext;

  bool get hasPrevious => _player.hasPrevious;

  @computed
  PlayState get playState => switch(_playingState) {
    ProcessingState.idle => PlayState.loading,
    ProcessingState.loading => PlayState.loading,
    ProcessingState.buffering => PlayState.loading,
    ProcessingState.ready => _playing ? PlayState.playing : PlayState.pause,
    ProcessingState.completed => PlayState.finish,
  };

  final sources = ConcatenatingAudioSource(children: []);

  _PlayerControllerBase() : _player = AudioPlayer() {
    _initialize();
  }

  _initialize() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _playerEventListen();
    await _setSource();
  }

  @action
  _playerEventListen() {
    _player.processingStateStream.listen((event) {
      _playingState = event;
    });
    _player.playingStream.listen((event) => _playing = event);
  }

  Future<void> _setSource() async {
    await _player.setAudioSource(sources);
  }

  Future<void> addSource({bool clear = true, required List<AudioSource> source}) async {
    if(clear) {
      await _player.stop();
      await sources.clear();
    }
    await sources.addAll(source);
  }

  void addMoreSource({required AudioSource source, int? index}) async {
    if(index != null) {
      await sources.insert(index, source);
    } else {
      await sources.add(source);
    }
  }

  play() async {
    await _player.play();
  }

  pause() async {
    await _player.pause();
  }

  seekTo({required Duration duration}) {
    _player.seek(duration);
  }

  playWithSource({required List<AudioSource> source}) async {
    await addSource(source: source);
    await play();
  }

  setShuffle(bool shuffle) {
    _player.setShuffleModeEnabled(shuffle);
  }

  @override
  FutureOr onDispose() {
    _player.dispose();
  }
}

enum PlayState {
  loading,
  playing,
  pause,
  finish;
}