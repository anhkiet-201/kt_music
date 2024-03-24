import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/ui/widgets/image/s_image.dart';
import 'package:kt_course/ui/widgets/upload/controller/upload_controller.dart';

class ImageUpload extends StatelessWidget {
  final UploadController controller;
  const ImageUpload({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.background,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: context.color.onBackground.withOpacity(0.3)),
      ),
      child: Observer(builder: (context) {
        return AnimatedSwitcher(
          duration: Durations.medium1,
          child: controller.isCompleted
              ? SImage(
                  url: controller.url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  borderRadius: BorderRadius.circular(5),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 10,
                      child: Observer(builder: (context) {
                        return LinearProgressIndicator(
                          value: controller.process,
                          borderRadius: BorderRadius.circular(5),
                        );
                      }),
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
