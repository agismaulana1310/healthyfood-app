import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
<<<<<<< HEAD
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});
=======
  const BottomNav({super.key});
>>>>>>> edde103b098d50fbd832ba7078cdd9ab21883771

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
<<<<<<< HEAD
      currentIndex: currentIndex, // Highlight icon yang aktif
      onTap: onTap, // Fungsi saat icon di-klik
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed, // Supaya icon tidak geser/putih
=======
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
>>>>>>> edde103b098d50fbd832ba7078cdd9ab21883771
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
<<<<<<< HEAD
}
=======
}
>>>>>>> edde103b098d50fbd832ba7078cdd9ab21883771
