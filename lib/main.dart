import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login-page/landing_page.dart'; // Memanggil halaman Landing

void main() {
  // Mengatur status bar agar tembus pandang (opsional, untuk tampilan lebih bersih)
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
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG"
      theme: ThemeData(
        fontFamily: 'Roboto', // Ganti dengan font pilihan Anda jika ada
        primaryColor: const Color(0xFF51B036), // Hijau khas Kede
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LandingPage(), // Mulai dari halaman ini
    );
  }
}