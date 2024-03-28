import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase extends BaseController with Store, AuthControllerProvider {

  void openArtistManager() {
    if(authController.user?.artist == null) {
      nav.toArtistRegister();
      return;
    }
    nav.toArtistAccess();
  }

  void openProfile() => nav.toProfile();

  @override
  FutureOr onDispose() {

  }
}