import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/home_page.dart';

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
