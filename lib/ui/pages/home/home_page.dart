import 'package:flutter/material.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:kt_course/ui/pages/home/controller/home_controller.dart';
import 'package:kt_course/ui/widgets/mini_player_control/mini_player_control.dart';
import 'package:kt_course/ui/widgets/tab_bar/tab_bar.dart' as tab;

class HomePage extends StatelessWidget
  with ControllerProvider<HomeController>,
  TabBarControllerProvider {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageView,
      bottomNavigationBar: const tab.TabBar(),
      floatingActionButton: const MiniPlayerControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget get _pageView => Builder(builder: (context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabbarController.pageController,
      children: tabbarController.listTab.map((e) => e.page).toList(),
    );
  });
}