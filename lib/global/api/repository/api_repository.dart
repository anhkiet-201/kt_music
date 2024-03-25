import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/services/model/artist/artist.dart';

abstract interface class ApiRepository extends BaseRepository {
  Future<void> registerAsArtist({required Artist artist});
}