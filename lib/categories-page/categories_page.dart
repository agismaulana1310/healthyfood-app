import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Fruits',
        'items': '87 Items',
        'icon': Icons.grain,
      },
      {
        'name': 'Vegetables',
        'items': '24 Items',
        'icon': Icons.eco,
      },
      {
        'name': 'Mushroom',
        'items': '43 Items',
        'icon': Icons.emoji_nature,
      },
      {
        'name': 'Dairy',
        'items': '22 Items',
        'icon': Icons.local_drink,
      },
      {
        'name': 'Oats',
        'items': '64 Items',
        'icon': Icons.rice_bowl,
      },
      {
        'name': 'Bread',
        'items': '43 Items',
        'icon': Icons.bakery_dining,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // 🔥 PANAH KIRI → KE WISHLIST
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/wishlist');
          },
        ),

        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
      ),

      // ================= BODY =================
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];

          return GestureDetector(
            onTap: () {
              // 👉 KE CATEGORY PAGE
              Navigator.pushNamed(
                context,
                '/category',
                arguments: {
                  'name': item['name'],
                  'items': item['items'],
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4CAF50),
                    Color(0xFF66BB6A),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ================= TEXT =================
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['items'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  // ================= ICON =================
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item['icon'],
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}