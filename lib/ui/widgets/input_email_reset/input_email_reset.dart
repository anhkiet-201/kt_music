import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:kt_course/ui/widgets/input_email_reset/controller/input_email_reset_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class InputEmailReset extends StatelessWidget with ControllerProvider<InputEmailResetController> {
  const InputEmailReset({super.key});


  @override
  Widget build(BuildContext context) {
    final ctrl = controller(context);
    return Observer(builder: (context) {
      return Scaffold(
        body: ctrl.isLoading ? _loading : _content,
      );
    });
  }

  Widget get _loading => Builder(builder: (context) {
        return Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: context.color.onBackground, size: 50),
        );
      });

  Widget get _content => Observer(builder: (context) {
        final ctrl = controller(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Chúng tôi sẽ gửi một email chứa ',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.color.onBackground,
                      ),
                    ),
                    TextSpan(
                      text: 'liên kết đặt lại mật khẩu.',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Email của bạn là gì?',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.color.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                autofocus: true,
                controller: ctrl.emailController,
                maxLines: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                ctrl.validation,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.color.error,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SButton(
                onPressed: ctrl.validation.isEmpty && ctrl.emailController.text.trim().isNotEmpty ? ctrl.sendEmailReset : null,
                child: Text(
                  'Xác nhận',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.color.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      });
}