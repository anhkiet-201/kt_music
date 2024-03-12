import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'reset_password_controller.g.dart';

class ResetPasswordController = _ResetPasswordControllerBase
    with _$ResetPasswordController;

abstract class _ResetPasswordControllerBase extends BaseController
    with Store, AuthControllerProvider {
  final String oobCode;
  final String apiKey;

  final TextEditingController newPasswordController = TextEditingController();

  _ResetPasswordControllerBase({
    required this.oobCode,
    required this.apiKey,
  }) {
    _initialize();
  }

  @readonly
  bool _isLoading = false;

  @readonly
  String? _email;

  @readonly
  String _validation = '';

  @readonly
  bool _shoudShowPassword = false;

  @action
  Future<void> _initialize() async {
    _isLoading = true;
    try {
      _email = await authController.getEmailReset(code: oobCode);

      /// Check support email
      if (authController.isLogined && (_email != authController.user?.email)) {
        nav.showSnackBar(message: 'Invalid email token!');
        nav.pop();
        return;
      }
      _isLoading = false;
      newPasswordController.addListener(() {
        final text = newPasswordController.text;
        if (text.isNotEmpty && text.length < 8) {
          _validation = 'Mật khẩu tối thiểu phải 8 ký tự';
        } else {
          _validation = '';
        }
      });
    } catch (_) {
      nav.pop();
    }
  }

  @action
  Future<void> setNewPassword() async {
    _isLoading = true;
    authController
        .confirmNewPassword(
      code: oobCode,
      newPassword: newPasswordController.text,
    )
        .then((value) {
      nav.showSnackBar(message: 'Updated password!');
      nav.pop();
    }).whenComplete(() => _isLoading = false);
  }

  @action
  void showOrHidePassword() => _shoudShowPassword = !_shoudShowPassword;

  @override
  FutureOr onDispose() {
    newPasswordController.dispose();
  }
}