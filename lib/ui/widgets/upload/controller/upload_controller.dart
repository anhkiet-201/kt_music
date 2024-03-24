import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:kt_course/core/firebase/fire_storage/upload_item.dart';
import 'package:kt_course/core/firebase/firebase_provider.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'upload_controller.g.dart';

class UploadController = _UploadControllerBase with _$UploadController;

abstract class _UploadControllerBase extends BaseController
    with Store, FirebaseFireStorageProvider {

  @readonly
  double _process = 0;

  @readonly
  bool _isCompleted = false;

  @readonly
  String _url = '';

  UploadTask? _task;

  Function(String url)? _completeCallBack;

  @action
  Future<void> executeUploadTask({required UploadItem uploadItem}) async {
    log.i('Upload file ${uploadItem.fileName}.${uploadItem.fileExtension}');
    _task = storage.upload(uploadItem: uploadItem, reference: uploadItem.reference);
    _task?.snapshotEvents.listen((event) {
      if (event.totalBytes == 0) return;
      _process = (event.bytesTransferred / event.totalBytes);
    }).onDone(() async {
      final url = await _task?.snapshot.ref.getDownloadURL() ?? '';
      _url = url;
      if(_completeCallBack != null) {
        _completeCallBack!(url);
      }
      _isCompleted = true;
      log.i('Upload file complete');
    });
  }

  void onComplete(Function(String url) completeCallBack) {
    _completeCallBack = completeCallBack;
  }

  Future<bool> pause() async => await _task?.pause() ?? false;

  @action
  Future<bool> cancel() async {
    final result = await _task?.cancel() ?? false;
    if(result) {
      _isCompleted = false;
    }
    return result;
  }

  Future<bool> resume() async => await _task?.resume() ?? false;

  @action
  Future<void> delete() async {
    await _task?.snapshot.ref.delete();
    _isCompleted = false;
  }

  @override
  FutureOr onDispose() {}
}