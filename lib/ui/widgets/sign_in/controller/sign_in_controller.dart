import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/constants.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase extends BaseController
    with Store, AuthControllerProvider {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  _SignInControllerBase() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _listen();
  }

  @readonly
  bool _shoudShowPassword = false;

  @readonly
  bool _shoudShowLoginButton = false;

  @readonly
  bool _isLoading = false;

  @action
  void showOrHidePassword() => _shoudShowPassword = !_shoudShowPassword;

  @readonly
  String _emailValidation = '';
  @readonly
  String _passwordValidation = '';

  @action
  _listen() {
    emailController.addListener(() {
      final email = emailController.text.trim();
      _emailValidation =
          !Constants.emailRegex.hasMatch(email) && email.isNotEmpty
              ? 'Email không hợp lệ!'
              : '';
      _checkShowButton();
    });

    passwordController.addListener(() {
      final password = passwordController.text.trim();
      _passwordValidation = password.length < 8 && password.isNotEmpty
          ? 'Mật khẩu tối thiểu 8 ký tự'
          : '';
      _checkShowButton();
    });
  }

  @action
  _checkShowButton() {
    _shoudShowLoginButton = emailController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty &&
        _emailValidation.isEmpty &&
        _passwordValidation.isEmpty;
  }

  @action
  Future<void> signIn() async {
    _isLoading = true;
    await authController.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    _isLoading = false;
  }

  void forgetPassword() {
    nav.toSendEmailReset();
  }

  @override
  FutureOr onDispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
