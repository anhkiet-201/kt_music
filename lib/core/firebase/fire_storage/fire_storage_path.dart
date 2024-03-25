part of 'fire_storage_query.dart';

extension FirebaseFireStoragePath on FirebaseFireStorageQuery {
  Reference get userPath =>
      _storage.ref('User').child(auth.currentUser?.uid ?? '');

  Reference get userAvatarPath => userPath.child('avatar');

  Reference get userArtistPath => userPath.child('artist');
}
