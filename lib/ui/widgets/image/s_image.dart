import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/ui/widgets/placeholder/s_placeholder.dart';

class SImage extends StatelessWidget {
  const SImage(
      {super.key,
      this.url,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.borderRadius,
      this.placeholder,
      this.errorView});

  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorView;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: _buildImage,
    );
  }

  Widget get _buildImage => Builder(builder: (context) {
        if (url == null) {
          return _buildError;
        }
        final isFromAsset = url!.startsWith('assets');
        final isSVG = url!.endsWith('.svg');
        if (isSVG) {
          if (isFromAsset) {
            return SvgPicture.asset(
              url!,
              width: width,
              height: height,
              fit: fit,
            );
          }
          return SvgPicture.network(
            url!,
            width: width,
            height: height,
            fit: fit,
          );
        }
        if(isFromAsset) {
          return Image.asset(
            url!,
            width: width,
              height: height,
              fit: fit,
          );
        }
        return CachedNetworkImage(
          imageUrl: url!,
          width: width,
          height: height,

          fit: fit,
          placeholder: (context, url) => placeholder ?? _placeholder,
          errorWidget: (context, url, error) => _buildError,
          alignment: Alignment.center,
        );
      });

  Widget get _buildError => Builder(
        builder: (context) {
          return errorView ??
              Text(
                ' Error',
                style: TextStyle(
                  color: context.color.error,
                ),
              );
        },
      );

  Widget get _placeholder => SPlaceholder(
        borderRadius: borderRadius ?? BorderRadius.zero,
      );
}
