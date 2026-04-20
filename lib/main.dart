import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login-page/landing_page.dart'; // Memanggil halaman Landing
import 'categories-page/categories_page.dart';
import 'categories-page/category_page.dart';
import 'categories-page/detail_page.dart';
import 'categories-page/wishlist_page.dart';
import 'pages/home_page.dart';

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
      routes: {
        '/home': (context) => const HomePage(),
        '/wishlist': (context) => const WishlistPage(),
        '/category': (context) => const CategoryPage(),
        '/detail': (context) => const DetailPage(),
        '/categories': (context) => const CategoriesPage(),
      },
      home: const LandingPage(), // Mulai dari halaman ini
    );
  }
}
