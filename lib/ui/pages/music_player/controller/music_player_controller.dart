import 'dart:async';

import 'package:kt_course/global/player/player_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'music_player_controller.g.dart';

class MusicPlayerController = _MusicPlayerControllerBase with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase extends BaseController with Store, PlayerControllerProvider {

  Stream<Duration?> get playDuration => playerController.duration;

  @readonly
  Duration? _playPosition;

  bool _isSeeking = false;

  _MusicPlayerControllerBase() {
    _initialize();
  }

  Future<void> _initialize() async {
    playerController.position.listen((event) {
      if(!_isSeeking) {
        _playPosition = event;
      }
    });
  }

  onStartSeek(double value) {
    _isSeeking = true;
  }

  onSeeking(double value) {
    _playPosition = Duration(milliseconds: value.toInt());
  }

  onEndSeek(double value) {
    playerController.seekTo(duration: Duration(milliseconds: value.toInt()));
    _isSeeking = false;
  }

  @override
  FutureOr onDispose() {

  }
}