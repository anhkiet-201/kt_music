import 'package:firebase_database/firebase_database.dart';
import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/firebase/fire_auth/fire_auth.dart';
import 'package:kt_course/core/firebase/fire_storage/fire_storage_query.dart';
import 'package:kt_course/core/firebase/fire_store/fire_store_query.dart';

mixin FirebaseAuthProvider {
  FirebaseFireAuth get auth => injector.get();
}

mixin FirebaseFireStoreProvider {
  FirebaseFireStoreQuery get fireStore => injector.get();
}

mixin FirebaseDatabaseProvider {
  FirebaseDatabase get database => FirebaseDatabase.instance;
}

mixin FirebaseFireStorageProvider {
  FirebaseFireStorageQuery get storage => injector.get();
}