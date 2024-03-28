import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/app/navigation/navigator_impl.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase extends BaseController with Store, AuthControllerProvider {

  final User? _user;

  final scrollController = ScrollController();

  @computed
  User? get user => _user ?? authController.user;

  @readonly
  double _appBarBackgroundProgress = 0.0;

  bool get isCurrent => _user == null;

  _ProfileControllerBase({User? user}) : _user = user {
    _listenScroll();
  }

  @action
  void _listenScroll() {
    final profileHeight = (globalContext?.height ?? 900) * 0.8;
    scrollController.addListener(() {
      final progress = scrollController.offset / profileHeight;
      if(progress < 0) {
        _appBarBackgroundProgress = 0;
      } else if(progress > 1) {
        _appBarBackgroundProgress = 1;
      } else {
        _appBarBackgroundProgress = progress;
      }
    });
  }

  @override
  FutureOr onDispose() {

  }
}