import 'package:kt_course/core/base/services/base_services.dart';

abstract class KTMusicServices extends BaseServices {
  Future<void> sign({required String email, required String password});

  Future<void> signWithGoogle();

  bool get isLogined;

  Future<void> signOut();

  Future<void> signUp({required String email,
      required String password,
      required String name,
      required String age,
      required String gender});

  Future<void> sync(); 
}