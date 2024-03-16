import 'package:flutter/material.dart';

extension DynamicColor on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

class SColors {
  const SColors._();

  static const cardContainer = Color.fromARGB(255, 38, 39, 39);
}