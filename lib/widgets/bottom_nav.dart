import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
}