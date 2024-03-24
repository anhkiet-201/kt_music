import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'artist_access_controller.g.dart';

class ArtistAccessController = _ArtistAccessControllerBase with _$ArtistAccessController;

abstract class _ArtistAccessControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}