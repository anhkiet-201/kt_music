import 'package:kt_course/core/base/exception/api_error.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/services/model/artist/artist.dart';
import 'package:kt_course/global/api/repository/api_repository.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';

class ApiRepositoryImpl
    with
        AuthRepositoryProvider,
        FirebaseFireStorageProvider,
        FirebaseFireStoreProvider
    implements ApiRepository {

  @override
  Future<void> registerAsArtist({required Artist artist}) async {
    final user = authRepository.user;
    if(user == null) {
      throw APIError(messages: ['Something is wrong']);
    }
    await fireStore.registerAsArtist(
      artist: artist,
      user: user,
    );
  }
}
