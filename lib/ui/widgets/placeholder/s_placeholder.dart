import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kt_course/common/color/color.dart';

class SPlaceholder extends StatelessWidget {
  final double? height, width;
  final BorderRadiusGeometry borderRadius;
  final BoxShape shape;
  final Color? color;

  const SPlaceholder({
    super.key,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    this.shape = BoxShape.rectangle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? context.color.background,
        borderRadius: borderRadius,
        shape: shape,
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(), // Loop the animation
        )
        .shimmer(
          duration: 2000.ms,
          color: context.color.onBackground.withOpacity(0.1),
        );
  }
}
