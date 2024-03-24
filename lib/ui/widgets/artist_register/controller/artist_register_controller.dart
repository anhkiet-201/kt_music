import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart' hide FileType;
import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/firebase/fire_storage/fire_storage_query.dart';
import 'package:kt_course/core/firebase/fire_storage/upload_item.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/services/model/artist/artist.dart';
import 'package:kt_course/ui/widgets/upload/controller/upload_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';
part 'artist_register_controller.g.dart';

class ArtistRegisterController = _ArtistRegisterControllerBase
    with _$ArtistRegisterController;

abstract class _ArtistRegisterControllerBase extends BaseController
    with Store, FirebaseFireStorageProvider, FirebaseFireStoreProvider {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final UploadController uploadController = UploadController();
  final formKey = GlobalKey<FormState>();

  _ArtistRegisterControllerBase() {
    uploadController.onComplete(onUploadComplete);
    nameController.addListener(_listen);
  }

  @readonly
  bool _isPickedFile = false;

  @readonly
  String _url = '';

  @readonly
  String _nameValidation = '';

  @computed
  bool get isValid =>
      _nameValidation.isEmpty &&
      nameController.text.trim().isNotEmpty &&
      (_isPickedFile == _url.isNotEmpty);

  @readonly
  bool _isLoading = false;

  @action
  _listen() {
    if (nameController.text.trim().isEmpty) {
      _nameValidation = 'Không được để trống';
    } else {
      _nameValidation = '';
    }
  }

  @action
  Future<void> pickFile() async {
    if (!await _permissionRequest()) {
      nav.showSnackBar(message: 'Need permision to access photos');
      return;
    }
    final filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult == null) {
      _isPickedFile = false;
      return;
    }
    uploadController.executeUploadTask(
      uploadItem: UploadItem(
        reference: storage.userAvatarPath,
        file: File(filePickerResult.files.single.path!),
        fileType: FileType.image,
      ),
    );
    _isPickedFile = true;
  }

  @action
  void onUploadComplete(String url) {
    _url = url;
  }

  @action
  void clearPickedImage() {
    _isPickedFile = false;
    _url = '';
    if (uploadController.isCompleted) {
      uploadController.delete();
    } else {
      uploadController.cancel();
    }
  }

  @action
  Future<void> submit() async {
    _isLoading = true;
    try {
      // await fireStore.registerAsArtist(
      //   artist: Artist(
      //     name: nameController.text.trim(),
      //     description: descriptionController.text.trim(),
      //     thumbnail: _url,
      //   ),
      // );
    } catch (error) {
      nav.showSnackBar(error: error);
    }
    nav.pop();
    _isLoading = false;
    nav.showSnackBar(message: 'You are an artist now!');
  }

  Future<bool> _permissionRequest() async {
    await Permission.photos.request();
    return await Permission.photos.isGranted ||
        await Permission.photos.isLimited;
  }

  @action
  Future<void> register() async {}

  @override
  FutureOr onDispose() {
    nameController.dispose();
    descriptionController.dispose();
  }
}
