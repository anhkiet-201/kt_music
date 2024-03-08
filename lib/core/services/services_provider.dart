import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/services/kt_music_services.dart';
import 'package:kt_course_apis/core/service/api_services.dart';

mixin ApiServiceProvider on Object {
  KTMusicServices get apiService => injector.get();
}