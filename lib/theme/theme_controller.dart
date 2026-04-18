import 'package:flutter/material.dart';

class ThemeController {
  static ValueNotifier<bool> isDark = ValueNotifier(false);
  static ValueNotifier<Color> primaryColor = ValueNotifier(const Color(0xFF4CAF50));
}