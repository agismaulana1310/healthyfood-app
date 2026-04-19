import 'package:flutter/material.dart';
import '../categories-page/categories_page.dart';
import '../categories-page/wishlist_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 1) {
          // Swap icon → Categories Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CategoriesPage()),
          );
        } else if (index == 3) {
          // Heart/Love icon → Wishlist Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WishlistPage()),
          );
        }
      },
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
