import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/banner.dart';
import '../widgets/category.dart';
import '../widgets/trending.dart';
import '../widgets/bottom_nav.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Header(),
            SizedBox(height: 20),
            BannerSection(),
            SizedBox(height: 20),
            Category(),
            SizedBox(height: 20),
            Trending(),
          ],
        ),
      ),
      const Center(child: Text("Halaman Transaksi")), 
      const CartPage(), 
      const Center(child: Text("Halaman Favorit")),  
      const Center(child: Text("Halaman Profil")), 
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: pages[_currentIndex]),

      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
