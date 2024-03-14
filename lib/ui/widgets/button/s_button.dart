import 'package:flutter/material.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';

class SButton extends StatelessWidget {
  const SButton(
      {super.key,
      this.style = SButtonStyle.filled,
      this.onPressed,
      required this.child,
      this.padding = const EdgeInsets.all(2),
      this.expand = true});

  final SButtonStyle style;
  final Function()? onPressed;
  final Widget child;
  final EdgeInsets padding;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return BouncingTapWaraper(
      child: Padding(
        padding: padding,
        child: switch (style) {
          SButtonStyle.filled => _buildFilledStyle,
          SButtonStyle.outlined => _buildOutlinedStyle,
          SButtonStyle.text => _buildTextStyle,
          SButtonStyle.normal => _buildNormalStyle
        },
      ),
    );
  }

  Widget get _buildFilledStyle => IconButton.filled(
        onPressed: onPressed,
        icon: child,
        style: IconButton.styleFrom(
            minimumSize: Size(expand ? double.infinity : 50, 50)),
      );

  Widget get _buildOutlinedStyle => IconButton.outlined(
        onPressed: onPressed,
        icon: child,
        style: IconButton.styleFrom(
            minimumSize: Size(expand ? double.infinity : 50, 50)),
      );

  Widget get _buildTextStyle => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            minimumSize: Size(expand ? double.infinity : 50, 50)),
        child: child,
      );

  Widget get _buildNormalStyle => IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
            minimumSize: Size(expand ? double.infinity : 50, 50)),
        icon: child,
      );
}

enum SButtonStyle {
  outlined,
  filled,
  text,
  normal;
}
