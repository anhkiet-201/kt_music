import 'package:kt_course/core/base/services/base_services.dart';
import 'package:kt_course/core/services/model/user/user.dart';

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

  User? get user;

  Future<void> sync(); 

  Future<void> resetPassword({required String email});

  Future<String?> checkObbCode({required String code});

  Future<void> confirmNewPassword({required String oobCode, required String newPassword});
}