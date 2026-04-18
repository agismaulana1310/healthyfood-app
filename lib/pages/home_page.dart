import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/banner.dart';
import '../widgets/category.dart';
import '../widgets/trending.dart';
import '../widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
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
      ),

      bottomNavigationBar: const BottomNav(),
    );
  }
}