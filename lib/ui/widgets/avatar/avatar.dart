import 'package:flutter/material.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/ui/widgets/image/s_image.dart';

class Avatar extends StatelessWidget with AuthControllerProvider {
  const Avatar({super.key, this.radius = 50});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius,
      child: SImage(
        url: authController.user?.avatar,
        borderRadius: BorderRadius.circular(radius ),
      ),
    );
  }
}