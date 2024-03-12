import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/constants.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'input_email_reset_controller.g.dart';

class InputEmailResetController = _InputEmailResetControllerBase
    with _$InputEmailResetController;

abstract class _InputEmailResetControllerBase extends BaseController
    with Store, AuthControllerProvider {
  @readonly
  bool _isLoading = false;

  @readonly
  String _validation = '';

  @computed
  bool get shouldShowButton =>
      _validation.isEmpty && emailController.text.trim().isNotEmpty;

  final emailController = TextEditingController();

  _InputEmailResetControllerBase() {
    _initialize();
  }

  @action
  Future<void> _initialize() async {
    emailController.addListener(() {
      final email = emailController.text.trim();
      _validation =
          Constants.emailRegex.hasMatch(email) || emailController.text.trim().isEmpty ? '' : 'Email không hợp lệ';
    });
  }

  @action
  Future<void> sendEmailReset() async {
    _isLoading = true;
    authController
        .sendEmailReset(email: emailController.text.trim())
        .then((value) {
      nav.showSnackBar(message: 'We have send an email to you!');
      nav.pop();
    }).whenComplete(() => _isLoading = false);
  }

  @override
  FutureOr onDispose() {
    emailController.dispose();
  }
}
