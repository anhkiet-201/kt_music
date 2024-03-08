import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kt_course/common/color/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.style,
      this.controller,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.inputFormatters,
      this.onChanged});

  final String? hintText;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextInputType?keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          maxLines: maxLines,
          cursorColor: context.color.onBackground,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: style,
        ),
      ),
    );
  }
}
