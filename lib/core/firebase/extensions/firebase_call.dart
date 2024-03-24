import 'package:firebase_core/firebase_core.dart';
import 'package:kt_course/core/base/exception/api_error.dart';

Future<T> call<T>(Future<T> Function() function) async =>
    Future.microtask(() => function())
        .onError((FirebaseException error, stackTrace) {
      throw APIError(messages: [error.message ?? 'Something is wrong!']);
    });
