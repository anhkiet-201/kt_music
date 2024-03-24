part of 'fire_store_query.dart';

extension on FirebaseFireStoreQuery {
  CollectionReference<Map<String, dynamic>> get _userCollection =>
      _fireStore.collection('User');
  CollectionReference<Map<String, dynamic>> get _artistCollection =>
      _fireStore.collection('Artist');
}