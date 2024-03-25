import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_course/core/firebase/extensions/fire_store_extensions.dart';
import 'package:kt_course/core/firebase/extensions/firebase_call.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/services/model/artist/artist.dart';
import 'package:kt_course/core/services/model/user/user.dart';

part 'fire_store_path.dart';

class FirebaseFireStoreQuery
    with FirebaseFireStorageProvider, FirebaseAuthProvider {
  FirebaseFirestore get _fireStore => FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    await call(() => _userCollection.doc(user.uuid).add(user.toJson()));
  }

  Future<User?> getUserByUID(String uid) async {
    final data = await call(() => _userCollection.doc(uid).getOne);
    if (data == null) return null;
    return User.fromJson(data);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> onUserChange(String uuid) =>
      _userCollection.doc(uuid).snapshots().asBroadcastStream();

  Future<void> registerAsArtist(
      {required Artist artist, required User user}) async {
    await call(() => addUser(user.copyWith(artist: artist)));
  }
}
