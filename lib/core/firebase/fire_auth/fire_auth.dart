import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/core/base/exception/api_error.dart';
import 'package:kt_course/core/firebase/extensions/firebase_call.dart';

class FirebaseFireAuth {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.standard();

  Future<void> sign({required String email, required String password}) async {
    await call(() =>
        _auth.signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void> signWithGoogle() async {
    _auth.userChanges();
    final account = await _googleSignIn.signIn();
    final authentication = await account?.authentication;
    if (authentication == null) {
      throw APIError(messages: ['Login failure!']);
    }
    await call(() async {
      await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
        ),
      );
    });
  }

  User? get currentUser => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.disconnect();
    }
  }

  Future<User?> signUp(
      {required String email,
      required String password,
      required String name,
      required int age,
      required String gender}) async {
    return await call(() async {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user?.updateDisplayName(name);
      return credential.user;
    });
  }

  Future<void> resetPassword({required String email}) async {
    await call(() async {
      await _auth.sendPasswordResetEmail(email: email);
    });
  }

  Future<String?> checkObbCode({required String code}) async {
    return await call(() async {
      final actionInfo = await _auth.checkActionCode(code);
      return actionInfo.data['email'];
    });
  }

  Future<void> confirmNewPassword(
      {required String oobCode, required String newPassword}) async {
    await call(() async {
      await _auth.confirmPasswordReset(code: oobCode, newPassword: newPassword);
    });
  }
}
