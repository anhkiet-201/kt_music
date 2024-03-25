import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/api/repository/api_repository.dart';

mixin ApiRepositoryProvider {
  ApiRepository get apiRepository => injector.get<ApiRepository>();
}