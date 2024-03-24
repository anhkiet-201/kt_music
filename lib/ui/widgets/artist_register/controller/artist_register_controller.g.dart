// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArtistRegisterController on _ArtistRegisterControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_ArtistRegisterControllerBase.isValid'))
      .value;

  late final _$_isPickedFileAtom = Atom(
      name: '_ArtistRegisterControllerBase._isPickedFile', context: context);

  bool get isPickedFile {
    _$_isPickedFileAtom.reportRead();
    return super._isPickedFile;
  }

  @override
  bool get _isPickedFile => isPickedFile;

  @override
  set _isPickedFile(bool value) {
    _$_isPickedFileAtom.reportWrite(value, super._isPickedFile, () {
      super._isPickedFile = value;
    });
  }

  late final _$_urlAtom =
      Atom(name: '_ArtistRegisterControllerBase._url', context: context);

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

  late final _$_nameValidationAtom = Atom(
      name: '_ArtistRegisterControllerBase._nameValidation', context: context);

  String get nameValidation {
    _$_nameValidationAtom.reportRead();
    return super._nameValidation;
  }

  @override
  String get _nameValidation => nameValidation;

  @override
  set _nameValidation(String value) {
    _$_nameValidationAtom.reportWrite(value, super._nameValidation, () {
      super._nameValidation = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_ArtistRegisterControllerBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$pickFileAsyncAction =
      AsyncAction('_ArtistRegisterControllerBase.pickFile', context: context);

  @override
  Future<void> pickFile() {
    return _$pickFileAsyncAction.run(() => super.pickFile());
  }

  late final _$submitAsyncAction =
      AsyncAction('_ArtistRegisterControllerBase.submit', context: context);

  @override
  Future<void> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  late final _$registerAsyncAction =
      AsyncAction('_ArtistRegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_ArtistRegisterControllerBaseActionController =
      ActionController(name: '_ArtistRegisterControllerBase', context: context);

  @override
  dynamic _listen() {
    final _$actionInfo = _$_ArtistRegisterControllerBaseActionController
        .startAction(name: '_ArtistRegisterControllerBase._listen');
    try {
      return super._listen();
    } finally {
      _$_ArtistRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onUploadComplete(String url) {
    final _$actionInfo = _$_ArtistRegisterControllerBaseActionController
        .startAction(name: '_ArtistRegisterControllerBase.onUploadComplete');
    try {
      return super.onUploadComplete(url);
    } finally {
      _$_ArtistRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPickedImage() {
    final _$actionInfo = _$_ArtistRegisterControllerBaseActionController
        .startAction(name: '_ArtistRegisterControllerBase.clearPickedImage');
    try {
      return super.clearPickedImage();
    } finally {
      _$_ArtistRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValid: ${isValid}
    ''';
  }
}
