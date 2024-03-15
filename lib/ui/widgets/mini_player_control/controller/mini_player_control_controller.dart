import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'mini_player_control_controller.g.dart';

class MiniPlayerControlController = _MiniPlayerControlControllerBase with _$MiniPlayerControlController;

abstract class _MiniPlayerControlControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() { }
}