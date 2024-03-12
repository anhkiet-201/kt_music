import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:kt_course/ui/widgets/sign_in/controller/sign_in_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignIn extends StatelessWidget with ControllerProvider<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = controller(context);
    return Scaffold(
      body: Observer(builder: (context) {
        return ctrl.isLoading ? _loading : _content;
      }),
    );
  }

  Widget get _content => Builder(builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(
              height: 50,
            ),
            _inputEmail,
            const SizedBox(
              height: 40,
            ),
            _inputPassword,
            const SizedBox(
              height: 40,
            ),
            _signButton,
            const SizedBox(
              height: 10,
            ),
            _forgetButton
          ],
        );
      });

  Widget get _loading => Builder(builder: (context) {
        return Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: context.color.onBackground, size: 50),
        );
      });

  Widget get _inputEmail => Observer(builder: (context) {
        final ctrl = controller(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.color.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              controller: ctrl.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              ctrl.emailValidation,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.color.error,
              ),
            ),
          ],
        );
      });

  Widget get _inputPassword => Observer(builder: (context) {
        final ctrl = controller(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mật khẩu',
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.color.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: ctrl.passwordController,
              obscureText: !ctrl.shoudShowPassword,
              maxLines: 1,
              suffixIcon: IconButton(
                icon: Icon(
                  ctrl.shoudShowPassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                ),
                onPressed: ctrl.showOrHidePassword,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              ctrl.passwordValidation,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.color.error,
              ),
            ),
          ],
        );
      });

  Widget get _signButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return SButton(
          onPressed: !ctrl.shoudShowLoginButton
              ? null
              : ctrl.signIn,
          child: Text(
            'Đăng nhập',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      });

  Widget get _forgetButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return SButton(
          style: SButtonStyle.text,
          onPressed: ctrl.forgetPassword,
          child: Text(
            'Quên mật khẩu',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      });

  Widget _buildLabel(String label, {Color? color}) =>
      Builder(builder: (context) {
        return Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: color,
          ),
        );
      });
}
