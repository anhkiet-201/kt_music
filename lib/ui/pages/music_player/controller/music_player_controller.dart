import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'music_player_controller.g.dart';

class MusicPlayerController = _MusicPlayerControllerBase with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}