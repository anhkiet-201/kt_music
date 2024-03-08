import 'package:kt_course/core/services/services_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';

class AuthRepositoryImpl with ApiServiceProvider implements AuthRepository {
  @override
  Future<bool> signIn(LoginMethodProvider loginMethodProvider) async {
    try {
      if (loginMethodProvider is EmailAndPasswordLoginProvider) {
        await apiService.sign(
            email: loginMethodProvider.email,
            password: loginMethodProvider.password);
      } else if (loginMethodProvider is GoogleLoginProvider) {
        await apiService.signWithGoogle();
      }
      await apiService.sync();
    } catch (e) {
      await apiService.signOut();
      rethrow;
    }
    return true;
  }

  @override
  Future<bool> signOut() async {
    await apiService.signOut();
    return true;
  }

  @override
  bool get isLogined => apiService.isLogined;

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String name,
      required String age,
      required String gender}) async {
    await apiService.signUp(
        email: email, password: password, name: name, age: age, gender: gender);
    await apiService.sync();
    return true;
  }
}
