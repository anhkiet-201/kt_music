import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class OnboardingPage extends StatelessWidget
    with ControllerProvider<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.transparent,
              Colors.transparent
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: _content,
          ),
        ),
      ),
    );
  }

  Widget get _content => Builder(builder: (context) {
        return Column(
          children: [_appLogo, _introText, _optionsButton],
        );
      });

  /// App logo
  Widget get _appLogo => Padding(
        padding: const EdgeInsets.all(70),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
      );

  /// Intro text
  Widget get _introText => Builder(builder: (context) {
        return Text(
          'Hàng triệu bài hát.\nMiễn phí trên Soundtify.',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineMedium?.copyWith(
              color: context.color.onBackground, fontWeight: FontWeight.bold),
        );
      });

  Widget get _optionsButton => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 30),
          child: Column(
            children: [
              _signUpButton,
              _signInWithGoogle,
              _signIn,
            ],
          ),
        );
      });

  Widget get _signUpButton => Builder(builder: (context) {
        return SButton(
          child: Text(
            'Đăng ký miễn phí',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        );
      });

  Widget get _signInWithGoogle => Builder(builder: (context) {
        return SButton(
          style: SButtonStyle.outlined,
          child: Text(
            'Tiếp tục với Google',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        );
      });

  Widget get _signIn => Builder(builder: (context) {
        return SButton(
          style: SButtonStyle.text,
          child: Text(
            'Đăng nhập',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        );
      });
}
