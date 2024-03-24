import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'discover_controller.g.dart';

class DiscoverController = _DiscoverControllerBase with _$DiscoverController;

abstract class _DiscoverControllerBase extends BaseController with Store {

  @readonly
  TopbarOption _selectedOption = TopbarOption.all;

  _DiscoverControllerBase() {
  }


  @action
  void selectOption(TopbarOption option) {
  }

  @override
  FutureOr onDispose() {

  }
}

enum TopbarOption {
  all,
  category;

  String get title => switch(this) {
    all => 'Tất cả',
    category => 'Thể loại'
  };
}