// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadController on _UploadControllerBase, Store {
  late final _$_processAtom =
      Atom(name: '_UploadControllerBase._process', context: context);

  double get process {
    _$_processAtom.reportRead();
    return super._process;
  }

  @override
  double get _process => process;

  @override
  set _process(double value) {
    _$_processAtom.reportWrite(value, super._process, () {
      super._process = value;
    });
  }

  late final _$_isCompletedAtom =
      Atom(name: '_UploadControllerBase._isCompleted', context: context);

  bool get isCompleted {
    _$_isCompletedAtom.reportRead();
    return super._isCompleted;
  }

  @override
  bool get _isCompleted => isCompleted;

  @override
  set _isCompleted(bool value) {
    _$_isCompletedAtom.reportWrite(value, super._isCompleted, () {
      super._isCompleted = value;
    });
  }

  late final _$_urlAtom =
      Atom(name: '_UploadControllerBase._url', context: context);

  String get url {
    _$_urlAtom.reportRead();
    return super._url;
  }

  @override
  String get _url => url;

  @override
  set _url(String value) {
    _$_urlAtom.reportWrite(value, super._url, () {
      super._url = value;
    });
  }

  late final _$executeUploadTaskAsyncAction =
      AsyncAction('_UploadControllerBase.executeUploadTask', context: context);

  @override
  Future<void> executeUploadTask({required UploadItem uploadItem}) {
    return _$executeUploadTaskAsyncAction
        .run(() => super.executeUploadTask(uploadItem: uploadItem));
  }

  late final _$cancelAsyncAction =
      AsyncAction('_UploadControllerBase.cancel', context: context);

  @override
  Future<bool> cancel() {
    return _$cancelAsyncAction.run(() => super.cancel());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_UploadControllerBase.delete', context: context);

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
