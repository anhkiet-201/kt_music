import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/app_links/controller/app_links_controller.dart';

mixin AppLinksControllerProvider {
  AppLinksController get appLinksController => injector.get<AppLinksController>();
}