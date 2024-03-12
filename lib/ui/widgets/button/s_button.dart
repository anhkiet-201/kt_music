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
          SButtonStyle.text => _buildTextStyle
        },
      ),
    );
  }

  Widget get _buildFilledStyle => IconButton.filled(
        onPressed: onPressed,
        icon: child,
      );

  Widget get _buildOutlinedStyle => IconButton.outlined(
        onPressed: onPressed,
        icon: child,
      );

  Widget get _buildTextStyle => TextButton(
        onPressed: onPressed,
        child: child,
      );
}

enum SButtonStyle {
  outlined,
  filled,
  text;
}