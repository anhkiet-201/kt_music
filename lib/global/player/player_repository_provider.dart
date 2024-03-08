import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/player/repository/player_repository.dart';

mixin PlayerRepositoryProvider {
  PlayerRepository get playerRepository => injector.get<PlayerRepository>();
}