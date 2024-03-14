import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart' show AudioSession, AudioSessionConfiguration;
import 'package:just_audio_background/just_audio_background.dart';
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

  _PlayerControllerBase() : _player = AudioPlayer() {
    _initialize();
  }

  _initialize() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _playerEventListen();
    setSource(playlist: [
      ClippingAudioSource(
        child: AudioSource.uri(Uri.parse(
            "https://firebasestorage.googleapis.com/v0/b/datn-578a6.appspot.com/o/demo%2Fdownload.mp3?alt=media&token=ca6925e7-50e2-40f8-b4ed-3326b077ae26")
        ),
        tag: MediaItem(
          // Specify a unique ID for each media item:
            id: '2',
            // Metadata to display in the notification:
            album: "Album name",
            title: "Song name",
            artUri: Uri.parse(
                'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg')
        ),
      ),
      ClippingAudioSource(
        start: const Duration(seconds: 60),
        end: const Duration(seconds: 90),
        child: AudioSource.uri(Uri.parse(
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")),
        tag: MediaItem(
          // Specify a unique ID for each media item:
            id: '1',
            // Metadata to display in the notification:
            album: "Album name",
            title: "Song name",
            artUri: Uri.parse(
                'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg')),
      ),
    ]);
  }

  @action
  _playerEventListen() {
    _player.processingStateStream.listen((event) {
      _playingState = event;
    });
    _player.playingStream.listen((event) => _playing = event);
  }

  setSource({required List<AudioSource> playlist}) async {
    await _player.setAudioSource(ConcatenatingAudioSource(children: playlist));
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