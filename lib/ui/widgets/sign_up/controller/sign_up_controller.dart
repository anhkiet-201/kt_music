import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/constants.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase extends BaseController
    with Store, AuthControllerProvider {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController ageController;
  late final TextEditingController nameController;
  late final PageController pageController;

  _SignUpControllerBase() {
    pageController = PageController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    ageController = TextEditingController();
    nameController = TextEditingController();
    _listen();
  }

  @readonly
  bool _shoudShowPassword = false;

  @readonly
  SGender? _selectedGender;

  @readonly
  int _step = 0;

  @readonly
  bool _isLoading = false;

  final ObservableList<bool> completedStep =
      ObservableList.of(List.generate(5, (index) => false));

  final ObservableList<String> error =
      ObservableList.of(List.generate(5, (index) => ''));

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();

  @action
  void _listen() {
    emailController.addListener(() {
      _validation();
    });
    passwordController.addListener(() {
      _validation();
    });
    ageController.addListener(() {
      _validation();
    });
    nameController.addListener(() {
      _validation();
    });
    pageController.addListener(() {
      switch (pageController.page?.toInt()) {
        case 0:
          emailFocusNode.requestFocus();
          break;
        case 1:
          passwordFocusNode.requestFocus();
          break;
        case 2:
          ageFocusNode.requestFocus();
          break;
        case 4:
          nameFocusNode.requestFocus();
          break;
        default:
          FocusManager.instance.primaryFocus?.unfocus();
          break;
      }
    });
  }

  @action
  _validation() {
    error[_step] = switch (_step) {
      0 => Constants.emailRegex.hasMatch(emailController.text.trim()) ||
              emailController.text.isEmpty
          ? ''
          : 'Email không hợp lệ.',
      1 =>
        passwordController.text.length >= 8 || passwordController.text.isEmpty
            ? ''
            : 'Mật khẩu tối thiểu 8 ký tự.',
      2 => (int.tryParse(ageController.text) ?? 0) >= 15 &&
                  (int.tryParse(ageController.text) ?? 0) <= 100 ||
              ageController.text.isEmpty
          ? ''
          : 'Bạn không đủ tuổi để sử dụng.',
      3 => '',
      4 => '',
      _ => ''
    };
    completedStep[_step] = switch (_step) {
          0 => emailController.text.isNotEmpty,
          1 => passwordController.text.isNotEmpty,
          2 => ageController.text.isNotEmpty,
          3 => _selectedGender != null,
          4 => nameController.text.isNotEmpty,
          _ => false
        } &&
        error[_step].isEmpty;
  }

  @action
  void nextPage() {
    pageController.animateToPage(
      ++_step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @action
  void previousPage() {
    if (_step == 0) {
      nav.pop();
      return;
    }
    pageController.animateToPage(
      --_step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @action
  void showOrHidePassword() => _shoudShowPassword = !_shoudShowPassword;

  @action
  void selectGender(SGender gender) {
    _selectedGender = gender;
    _validation();
  }

  @action
  Future<void> signUp() async {
    if (_isLoading) return;
    _isLoading = true;
    await authController.signUp(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      age: ageController.text,
      gender: _selectedGender?.title ?? '',
    );
    _isLoading = false;
  }

  @override
  FutureOr onDispose() {
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    nameController.dispose();
    pageController.dispose();
  }
}

enum SGender {
  male,
  feMale,
  nonBinary,
  other,
  preferNotToSay;

  String get title => switch (this) {
        male => 'Male',
        feMale => 'Female',
        nonBinary => 'Non-binary',
        other => 'Other',
        preferNotToSay => 'Prefer Not To Say'
      };
}
