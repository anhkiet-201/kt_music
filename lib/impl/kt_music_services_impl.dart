import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:kt_course/core/base/exception/api_error.dart';
import 'package:kt_course/core/firebase/extensions/fire_store_extensions.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/services/kt_music_services.dart';
import 'package:kt_course/core/services/model/user/user.dart';

class KTMusicServicesImpl
  with 
  FirebaseAuthProvider,
  FirebaseFireStoreProvider
  implements KTMusicServices {
  
  Future<T> _call<T>(Future<T> Function() function) async =>
      Future.microtask(() => function())
          .onError((f_auth.FirebaseException error, stackTrace) {
        throw APIError(messages: [error.message ?? 'Something is wrong!']);
      });

  @override
  Future<void> sign({required String email, required String password}) async {
    await _call(() =>
        auth.signInWithEmailAndPassword(email: email, password: password));
  }

  @override
  Future<void> signWithGoogle() async {
    await _call(() => auth.signInWithProvider(f_auth.GoogleAuthProvider()));
  }

  @override
  bool get isLogined => auth.currentUser != null;

  f_auth.User get _authUser => auth.currentUser!;

  User? _user;
  User? get user => _user;

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signUp({required String email,
      required String password,
      required String name,
      required String age,
      required String gender}) async {
    await _call(() async {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await auth.currentUser?.updateDisplayName(name);
    });
  }

  @override
  Future<void> sync() async {
    await _call(() async {
      final response = await fireStore.getOne('User/${_authUser.uid}');
      final user = User.fromJson(response);
      _user = user.copyWith(
          uuid: _authUser.uid,
          email: _authUser.email!,
          name: _authUser.displayName ?? _authUser.email!);
    });
  }
}
