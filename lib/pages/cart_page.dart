import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'checkout_page.dart';
import '../widgets/bottom_nav.dart';
import '../categories-page/categories_page.dart';
import '../categories-page/wishlist_page.dart';
import '../pages/profile/profile_page.dart';
import 'home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      /// ================= BODY =================
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shopping Cart",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CheckoutPage()),
                      );
                    },
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ================= LIST =================
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ProductItem(
                    name: "Avocado",
                    price: 7.2,
                    qty: 4,
                    image: 'assets/images/alpukat.png',
                    description:
                        "Avocado segar dan sehat, cocok untuk gaya hidup aktif.",
                  ),
                  ProductItem(
                    name: "Broccoli",
                    price: 6.3,
                    qty: 1,
                    image: 'assets/images/brokoli.png',
                    description:
                        "Brokoli kaya nutrisi, cocok untuk makanan sehat.",
                  ),
                  ProductItem(
                    name: "Grapes",
                    price: 5.7,
                    qty: 2,
                    image: 'assets/images/anggur.png',
                    description: "Anggur manis dan juicy, kaya antioksidan.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoriesPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistPage()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      ),
    );
  }
}
