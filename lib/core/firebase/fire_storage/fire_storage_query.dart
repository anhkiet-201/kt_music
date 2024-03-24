import 'package:firebase_storage/firebase_storage.dart';
import 'package:kt_course/core/firebase/fire_storage/upload_item.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';

part 'fire_storage_path.dart';

class FirebaseFireStorageQuery with AuthControllerProvider {
  final _storage = FirebaseStorage.instance;

  // UploadTask updateAvatarByUID({
  //   required File image,
  //   required User user,
  // }) {
  //   final fileExtension = path.extension(image.path).replaceAll('.', '');
  //   return getUserAvatarPath(uid: user.uuid)
  //       .putFile(image, SettableMetadata(contentType: 'image/$fileExtension'));
  // }

  // UploadTask updateArtistThumnail({
  //   required File image,
  //   required User user,
  // }) {
  //   final fileExtension = path.extension(image.path).replaceAll('.', '');
  //   return getUserArtistPath(uid: user.uuid)
  //       .putFile(image, SettableMetadata(contentType: 'image/$fileExtension'));
  // }

  UploadTask upload(
      {required UploadItem uploadItem, required Reference reference}) {
    return reference.child(uploadItem.fileName).putFile(
          uploadItem.file,
          SettableMetadata(
            contentType:
                '${uploadItem.fileType.type}/${uploadItem.fileExtension.replaceAll('.', '')}',
          ),
        );
  }
}
