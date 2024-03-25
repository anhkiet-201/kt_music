import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'api_controller.g.dart';

class ApiController = _ApiControllerBase with _$ApiController;

abstract class _ApiControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}