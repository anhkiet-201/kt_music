import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:rxdart/rxdart.dart';
part 'app_links_controller.g.dart';

class AppLinksController = _AppLinksControllerBase with _$AppLinksController;

abstract class _AppLinksControllerBase extends BaseController with Store {
  late final AppLinks _appLinks;

  Future<bool> get isNormalLaunch async {
    return (await _appLinks.getInitialAppLinkString()) == null;
  }

  _AppLinksControllerBase() {
    _appLinks = AppLinks();
  }

  execute() {
    _appLinks.allUriLinkStream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((event) => _listen(event.queryParameters));
  }

  void _listen(Map<String, dynamic> parameters) async {
    final mode = parameters['mode'] ?? '';
    final linksDefine = <String, Function>{
      'resetPassword': () {
        nav.toResetPassword(
          oobCode: parameters['oobCode'] ?? '',
          apiKey: parameters['apiKey'] ?? '',
          lang: parameters['lang']
        );
      }
    };
    final targetLink = linksDefine[mode];
    targetLink?.call();
  }

  @override
  FutureOr onDispose() {}
}
