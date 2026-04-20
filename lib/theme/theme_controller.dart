import 'package:flutter/material.dart';

class ThemeController {
  // 🔥 Dark mode state (default ikut system)
  static ValueNotifier<bool> isDark = ValueNotifier(
    WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark,
  );

  // 🎨 Primary color global
  static ValueNotifier<Color> primaryColor = ValueNotifier(Colors.green);

  // 🔁 Toggle dark/light
  static void toggleTheme() {
    isDark.value = !isDark.value;
  }

  // 🎨 Ganti warna utama (opsional)
  static void changePrimary(Color color) {
    primaryColor.value = color;
  }
}