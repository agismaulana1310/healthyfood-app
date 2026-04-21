import 'package:flutter/material.dart';
import '/theme/colors.dart';
import '/theme/theme_controller.dart';
import '/login-page/landing_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDark,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor:
                isDark ? const Color(0xFF0D1B0F) : const Color(0xFFF2F2F2),
          )
              home: const LandingPage(),
            );
          },
        );
      },
    );
  }
}