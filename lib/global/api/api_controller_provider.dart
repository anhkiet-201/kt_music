import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/api/controller/api_controller.dart';

mixin ApiControllerProvider {
  ApiController get apiController => injector.get<ApiController>();
}