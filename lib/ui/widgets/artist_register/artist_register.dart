import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/artist_register/controller/artist_register_controller.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:kt_course/ui/widgets/upload/image_upload.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ArtistRegister extends StatelessWidget
    with ControllerProvider<ArtistRegisterController> {
  ArtistRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = controller(context);
    return Observer(builder: (context) {
      return ctrl.isLoading
          ? _loading
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: context.mediaQueryPadding.bottom, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPickImage,
                    const SizedBox(
                      height: 50,
                    ),
                    _buildInputName(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildInputDescription(),
                    const SizedBox(
                      height: 50,
                    ),
                    _submitButton,
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            );
    });
  }

  Widget get _loading => Builder(builder: (context) {
        return Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: context.color.onBackground, size: 50),
        );
      });

  SizedBox get _buildPickImage => SizedBox.square(
        dimension: 200,
        child: Observer(builder: (context) {
          final ctrl = controller(context);
          if (!ctrl.isPickedFile) {
            return SButton(
              onPressed: ctrl.pickFile,
              style: SButtonStyle.wrapItem,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: context.color.onBackground.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_rounded,
                      color: context.color.onBackground.withOpacity(0.3),
                    ),
                    Text(
                      'Add a photo',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.color.onBackground.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              ImageUpload(
                controller: ctrl.uploadController,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox.square(
                  dimension: 50,
                  child: SButton(
                      onPressed: ctrl.clearPickedImage,
                      style: SButtonStyle.filled,
                      expand: false,
                      child: Icon(
                        Icons.close_rounded,
                        color: context.color.onBackground,
                      )),
                ),
              )
            ],
          );
        }),
      );

  Widget _buildInputName() => Builder(builder: (context) {
        final ctrl = controller(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artist name',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: ctrl.nameController,
              maxLines: 1,
              textInputAction: TextInputAction.next,
            )
          ],
        );
      });

  Widget _buildInputDescription() => Builder(builder: (context) {
        final ctrl = controller(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: ctrl.descriptionController,
            )
          ],
        );
      });

  Widget get _submitButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return SButton(
          onPressed: ctrl.isValid ? ctrl.submit : null,
          child: const Text('Submit'),
        );
      });
}
