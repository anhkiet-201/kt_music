import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'onboarding_controller.g.dart';

class OnboardingController = _OnboardingControllerBase with _$OnboardingController;

abstract class _OnboardingControllerBase extends BaseController with Store, AuthControllerProvider {

  @readonly
  bool _isLoading = false;

  @action
  signInWithGoogle() async {
    _isLoading = true;
    await authController.signInWithGoogle();
    if(authController.isLogined) {
      nav.toHome();
    }
    _isLoading = false;
  }

  void signIn() {
    nav.toSignIn();
  }

  void signUp() {
    nav.toSignUp();
  }

  @override
  FutureOr onDispose() {

  }
}