import 'package:flutter/material.dart';
import 'pages/cart_page.dart';

feature/profil-page
import 'theme/theme_controller.dart';
import 'pages/profile/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:healthyfood_app/login-page/landing_page.dart';
main
 main

void main() {
  runApp(const MyApp());
}

class KedeApp extends StatelessWidget {
  const KedeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}
