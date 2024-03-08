import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/player/controller/player_controller.dart';

mixin PlayerControllerProvider {
  PlayerController get playerController => injector.get<PlayerController>();
}