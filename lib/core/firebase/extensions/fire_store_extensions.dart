import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_course/core/logger/logger.dart';

extension FirestoreExtension<T> on DocumentReference<T> {
  Future<T?> get getOne async {
    try {
      final snapshot = await get();
      return snapshot.data();
    } catch(e) {
      log.e(e);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getList(String path) async {
    final snapshot = await collection(path).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<void> add(dynamic data) async {
    try {
      await update(data);
    } catch (_) {
      log.d('user not exists!');
      await set(data);
    }
  }
}
