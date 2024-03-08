import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/services/model/user/user.dart';

abstract class LoginMethodProvider {}

class EmailAndPasswordLoginProvider extends LoginMethodProvider {
  EmailAndPasswordLoginProvider({
    required this.email, 
    required this.password,
    // required this.age,
    // required this.gender,
    // required this.name
    });
  final String email;
  final String password;
  // final String name;
  // final String age;
  // final String gender;
}

class GoogleLoginProvider extends LoginMethodProvider {
  GoogleLoginProvider();
}

abstract interface class AuthRepository extends BaseRepository {
  Future<bool> signIn(LoginMethodProvider loginMethodProvider);

  Future<bool> signOut();

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String age,
    required String gender
  });

  bool get isLogined;
}