import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/app_links/repository/app_links_repository.dart';

mixin AppLinksRepositoryProvider {
  AppLinksRepository get app_linksRepository => injector.get<AppLinksRepository>();
}