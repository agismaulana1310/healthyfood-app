import 'package:flutter/material.dart';
import 'theme_controller.dart';

class AppColors {
  static const backgroundLight = Color(0xFFF2F2F2);
  static const backgroundDark = Color(0xFF0D1B0F);
  static const white = Colors.white;
  static const grey = Colors.grey;
  static const defaultGreen = Color(0xFF4CAF50);
  
  static Color get background {
    return ThemeController.isDark.value ? backgroundDark : backgroundLight;
  }

  static Color get green {
    return ThemeController.primaryColor.value;
  }
}