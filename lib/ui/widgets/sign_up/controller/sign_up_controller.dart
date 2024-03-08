import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase extends BaseController with Store {
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

  final ObservableList<bool> completedStep = ObservableList.of(List.generate(5, (index) => false));

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
  }

  @action
  _validation() {
    completedStep[_step] = switch (_step) {
      0 => emailController.text.isNotEmpty,
      1 => passwordController.text.isNotEmpty,
      2 => ageController.text.isNotEmpty,
      3 => _selectedGender != null,
      4 => nameController.text.isNotEmpty,
      _ => false
    };
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
    if(_step == 0) {
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
