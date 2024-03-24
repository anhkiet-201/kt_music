part of 'fire_storage_query.dart';

extension FirebaseFireStoragePath on FirebaseFireStorageQuery {
  Reference get userPath =>
      _storage.ref('User').child(authController.user?.uuid ?? '');

  Reference get userAvatarPath => userPath.child('avatar');

  Reference get userArtistPath => userPath.child('artist');
}
