import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_course/core/firebase/extensions/fire_store_extensions.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/services/model/artist/artist.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';

part 'fire_store_path.dart';

class FirebaseFireStoreQuery with FirebaseFireStorageProvider, AuthControllerProvider{
  FirebaseFirestore get _fireStore => FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    await _userCollection.doc(user.uuid).add(user.toJson());
  }

  Future<void> addArtist(Artist artist) async {
    await _artistCollection.doc(artist.id).add(artist.toJson());
  }

  Future<User?> getUserByUID(String uid) async {
    final data = await _userCollection.doc(uid).getOne;
    if (data == null) return null;
    return User.fromJson(data);
  }

  Future<void> registerAsArtist({
    required Artist artist
  }) async {
    final user = authController.user;
    if(user == null) return;
    await addArtist(artist);
    await addUser(user.copyWith(artistId: artist.id));
  }
}
