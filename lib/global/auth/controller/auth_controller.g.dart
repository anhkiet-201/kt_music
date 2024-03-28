// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<bool>? _$isLoginedComputed;

  @override
  bool get isLogined =>
      (_$isLoginedComputed ??= Computed<bool>(() => super.isLogined,
              name: '_AuthControllerBase.isLogined'))
          .value;

  late final _$_userAtom =
      Atom(name: '_AuthControllerBase._user', context: context);

  User? get user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  User? get _user => user;

  @override
  set _user(User? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_isSyncingAtom =
      Atom(name: '_AuthControllerBase._isSyncing', context: context);

  bool get isSyncing {
    _$_isSyncingAtom.reportRead();
    return super._isSyncing;
  }

  @override
  bool get _isSyncing => isSyncing;

  @override
  set _isSyncing(bool value) {
    _$_isSyncingAtom.reportWrite(value, super._isSyncing, () {
      super._isSyncing = value;
    });
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.signInWithGoogle', context: context);

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthControllerBase.signInWithEmailAndPassword',
      context: context);

  @override
  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _$signInWithEmailAndPasswordAsyncAction.run(() =>
        super.signInWithEmailAndPassword(email: email, password: password));
  }

  late final _$_handleSignInAsyncAction =
      AsyncAction('_AuthControllerBase._handleSignIn', context: context);

  @override
  Future<void> _handleSignIn() {
    return _$_handleSignInAsyncAction.run(() => super._handleSignIn());
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthControllerBase.signUp', context: context);

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required String age,
      required String gender}) {
    return _$signUpAsyncAction.run(() => super.signUp(
        email: email,
        password: password,
        name: name,
        age: age,
        gender: gender));
  }

  late final _$syncUserAsyncAction =
      AsyncAction('_AuthControllerBase.syncUser', context: context);

  @override
  Future<void> syncUser({bool syncWithUpdateState = true}) {
    return _$syncUserAsyncAction
        .run(() => super.syncUser(syncWithUpdateState: syncWithUpdateState));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthControllerBase.logout', context: context);

  @override
  Future<void> logout({bool allDevices = false}) {
    return _$logoutAsyncAction.run(() => super.logout(allDevices: allDevices));
  }

  late final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase', context: context);

  @override
  void _listenUserChange() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase._listenUserChange');
    try {
      return super._listenUserChange();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogined: ${isLogined}
    ''';
  }
}
