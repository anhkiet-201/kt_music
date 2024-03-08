import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreExtension on FirebaseFirestore {
  Future<Map<String, dynamic>> getOne(String path) async {
    final snapshot = await collection(path).get();
    return snapshot.docs.first.data();
  }

  Future<List<Map<String, dynamic>>> getList(String path) async {
    final snapshot = await collection(path).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
