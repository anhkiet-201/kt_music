import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' show basenameWithoutExtension, extension;

class UploadItem {
  final Reference reference;
  final String _fileName;
  final File file;
  final String fileExtension;
  final UploadFileType fileType;

  UploadItem({
    required this.reference,
    required this.file,
    String? fileName,
    required this.fileType,
  })  : _fileName = fileName ?? basenameWithoutExtension(file.path),
        fileExtension = extension(file.path);

  String get fileName => _fileName;
}

enum UploadFileType {
  video,
  image,
  audio;

  String get type => switch (this) {
        video => 'video',
        image => 'image',
        audio => 'audio',
      };
}
