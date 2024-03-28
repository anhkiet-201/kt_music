import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/profile/controller/profile_controller.dart';
import 'package:kt_course/ui/widgets/avatar/avatar.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';

class ProfilePage extends StatelessWidget
    with ControllerProvider<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SingleChildScrollView(
        controller: controller(context).scrollController,
        child: Column(children: [_profile, const SizedBox(height: 1000,)])),
    );
  }

  PreferredSize get _appBar => PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: Observer(
      builder: (context) {
        final ctrl = controller(context);
        return AppBar(
          backgroundColor: context.color.background.withOpacity(ctrl.appBarBackgroundProgress),
          surfaceTintColor: Colors.transparent,
          actions: const [
            SButton(
              style: SButtonStyle.wrapItem,
              expand: false,
              child: Icon(Icons.more_horiz_rounded),),
              SizedBox(
                width: 16,
              )
          ],
        );
      }
    ),
  );

  Widget get _profile => Builder(builder: (context) {
        final ctrl = controller(context);
        return SizedBox(
          width: double.infinity,
          height: context.height * 0.8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Avatar(
                radius: 0,
              ),
              _profileInfo
            ],
          ),
        );
      });

  Widget get _profileInfo => Builder(builder: (context){
    final ctrl = controller(context);
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.black26,
                context.color.background
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  const Spacer(),
                  // Name
                  Observer(builder: (context) {
                    return Text(
                      '${ctrl.user?.name}',
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  /// Email
                  Observer(builder: (context) {
                    return Text(
                      '${ctrl.user?.email}',
                      style: context.textTheme.labelLarge,
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  /// Flow info
                  Observer(builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0 Follower',
                          style: context.textTheme.labelLarge,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '0 Following',
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  /// Flow button
                  _flowButton
                ],
              ),
            );
  });

  Widget get _flowButton => Builder(
    builder: (context) {
      return SButton(child: const Text('Follow now', style: TextStyle(fontWeight: FontWeight.bold),), onPressed: (){},);
    }
  );
}
