import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_course/core/logger/logger.dart';

extension FirestoreExtension on FirebaseFirestore {
  Future<Map<String, dynamic>> getOne(String path) async {
    try {
      final snapshot = await collection(path).get();
      return snapshot.docs.first.data();
    } catch(e) {
      log.e(e);
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> getList(String path) async {
    final snapshot = await collection(path).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
