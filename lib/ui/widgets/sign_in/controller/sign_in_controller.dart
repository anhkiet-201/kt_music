import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase extends BaseController with Store {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  _SignInControllerBase() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @readonly
  bool _shoudShowPassword = false;

  @readonly
  bool _shoudShowLoginButton = false;

  @action
  void showOrHidePassword() => _shoudShowPassword = !_shoudShowPassword;

  @override
  FutureOr onDispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}