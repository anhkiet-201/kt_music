import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

mixin FirebaseAuthProvider {
  FirebaseAuth get auth => FirebaseAuth.instance;
}

mixin FirebaseFireStoreProvider {
  FirebaseFirestore get fireStore => FirebaseFirestore.instance;
}

mixin FirebaseDatabaseProvider {
  FirebaseDatabase get database => FirebaseDatabase.instance;
}

mixin FirebaseStorageProvider {
  FirebaseStorage get storage => FirebaseStorage.instanceFor(bucket: '');
}