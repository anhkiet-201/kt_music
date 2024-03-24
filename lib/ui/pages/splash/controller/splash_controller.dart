import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kt_course/global/app_links/app_links_controller_provider.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase extends BaseController
    with Store, AuthControllerProvider, AppLinksControllerProvider {
  @observable
  bool isInitialized = false;

  @action
  initialize() async {
    FirebaseAuth.instance.userChanges().listen((event) {
      authController.syncUser();
    });
    appLinksController.execute();
  }

  @override
  FutureOr onDispose() {}
}
