import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:kt_course/ui/widgets/sign_up/controller/sign_up_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUp extends StatelessWidget with ControllerProvider<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tạo tài khoản',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: controller(context).previousPage,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: _content,
    );
  }

  Widget get _content => Builder(builder: (context) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller(context).pageController,
          children: [
            _inputEmail,
            _inputPassword,
            _inputAge,
            _selectGender,
            _inputName,
          ],
        );
      });

  Widget get _inputEmail => Observer(builder: (context) {
        final ctrl = controller(context);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
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
                focusNode: ctrl.emailFocusNode,
                controller: ctrl.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 5,),
              _buildLabel(ctrl.error[0], color: context.color.error),
              const SizedBox(
                height: 20,
              ),
              _buildNextButton(0),
            ],
          ),
        );
      });

  Widget get _inputPassword => Observer(builder: (context) {
        final ctrl = controller(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Tạo một mật khẩu',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.color.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                focusNode: ctrl.passwordFocusNode,
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
              _buildLabel(ctrl.error[1], color: context.color.error),
              const SizedBox(
                height: 20,
              ),
              _buildNextButton(1),
            ],
          ),
        );
      });

  Widget get _inputAge => Observer(builder: (context) {
        final ctrl = controller(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Tuổi của bạn',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.color.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                focusNode: ctrl.ageFocusNode,
                controller: ctrl.ageController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 5,
              ),
              _buildLabel(ctrl.error[2], color: context.color.error),
              const SizedBox(
                height: 20,
              ),
              _buildNextButton(2),
            ],
          ),
        );
      });

  Widget get _selectGender => Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Giới tính của bạn là gì?',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.color.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children:
                    SGender.values.map((e) => _buildGenderSelector(e)).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildNextButton(3),
            ],
          ),
        );
      });

  Widget _buildGenderSelector(SGender gender) {
    return Observer(builder: (context) {
      final ctrl = controller(context);
      final isSelected = gender == ctrl.selectedGender;
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: BouncingTapWaraper(
          child: IconButton.outlined(
            onPressed: () => ctrl.selectGender(gender),
            icon: Text(
              gender.title,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.color.onBackground
                    .withOpacity(isSelected ? 1.0 : 0.5),
              ),
            ),
            style: IconButton.styleFrom(
              minimumSize: const Size(50, 50),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              side: BorderSide(
                color:
                    context.color.outline.withOpacity(isSelected ? 1.0 : 0.5),
                width: 2,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNextButton(int step) => Observer(builder: (context) {
        final ctrl = controller(context);
        return SButton(
          onPressed: ctrl.completedStep[step] ? ctrl.nextPage : null,
          child: Text(
            'Tiếp',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.color.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      });

  Widget get _inputName => Observer(builder: (context) {
        final ctrl = controller(context);
        return Scaffold(
          extendBody: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Tên của bạn là gì?',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: context.color.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    focusNode: ctrl.nameFocusNode,
                    controller: ctrl.nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildLabel(
                    'Thông tin này sẽ xuất hiện trong hồ sơ Soundtify của bạn.',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  _termsAndPolicies,
                  const SizedBox(
                    height: 160,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color:
                        ctrl.completedStep[4] ? null : context.color.background,
                    borderRadius: BorderRadius.circular(25)),
                child: SButton(
                  onPressed: ctrl.completedStep[4] ? ctrl.signUp : null,
                  child: ctrl.isLoading
                      ? SizedBox.square(
                          dimension: 25,
                          child: LoadingAnimationWidget.prograssiveDots(
                            color: context.color.onBackground,
                            size: 25,
                          ),
                        )
                      : Text(
                          'Tạo tài khoản',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.color.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      });

  Widget get _termsAndPolicies => Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(
              'Bằng việc nhấn vào "Tạo tài khoản", bạn đồng ý với Điều khoản sử dụng của Soundtify.',
            ),
            const SizedBox(
              height: 10,
            ),
            _buildLabel(
              'Điều khoản sử dụng',
              color: context.color.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildLabel(
              'Để tìm hiểu thêm về các thức Soundtify thu thập, sử dụng, chia sẻ và bảo vệ dữ liệu cá nhân của bạn, vui lòng xem Chính sách quyền riêng tư của Soundtify.',
            ),
            const SizedBox(
              height: 10,
            ),
            _buildLabel(
              'Chính sách quyền riêng tư',
              color: context.color.primary,
            ),
          ],
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
