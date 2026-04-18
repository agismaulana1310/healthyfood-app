import 'package:flutter/material.dart';
feature/profil-page
import 'theme/theme_controller.dart';
import 'pages/profile/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:healthyfood_app/login-page/landing_page.dart';
main

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const KedeApp());
}

class KedeApp extends StatelessWidget {
  const KedeApp({super.key});

  @override
  Widget build(BuildContext context) {
feature/profil-page
    return ValueListenableBuilder(
      valueListenable: ThemeController.isDark,
      builder: (context, isDark, child) {
        return ValueListenableBuilder(
          valueListenable: ThemeController.primaryColor,
          builder: (context, primaryColor, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: isDark ? Brightness.dark : Brightness.light,
                scaffoldBackgroundColor:
                    isDark ? const Color(0xFF0D1B0F) : const Color(0xFFF2F2F2),
                primaryColor: primaryColor,
              ),
              home: const ProfilePage(),
            );
          },
        );
      },
    );
  }
}
    return MaterialApp(
      title: 'Kede Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF51B036),
        scaffoldBackgroundColor: Colors.white,
      ),

      home: const LandingPage(),
    );
  }
}
main
