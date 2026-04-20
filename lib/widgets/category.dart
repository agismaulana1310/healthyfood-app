import 'package:flutter/material.dart';
import '../categories-page/categories_page.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> categories = [
      {
        'name': 'Fruits',
        'items': '87 Items',
        'icon': Icons.apple,
      },
      {
        'name': 'Vegetables',
        'items': '24 Items',
        'icon': Icons.eco,
      },
      {
        'name': 'Mushroom',
        'items': '43 Items',
        'icon': Icons.restaurant_menu,
      },
      {
        'name': 'Dairy',
        'items': '22 Items',
        'icon': Icons.lunch_dining,
      },
      {
        'name': 'Oats',
        'items': '64 Items',
        'icon': Icons.bakery_dining,
      },
      {
        'name': 'Bread',
        'items': '43 Items',
        'icon': Icons.local_dining,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CategoriesPage()),
                  );
                },
                child: const Icon(Icons.arrow_forward, color: Colors.green),
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];

                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: i == 0 ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // ignore: deprecated_member_use
                    border: Border.all(color: Colors.green.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/category',
                        arguments: {
                          'name': category['name'] as String,
                          'items': category['items'] as String,
                        },
                      );
                    },
                    child: Icon(
                      category['icon'] as IconData,
                      color: i == 0 ? Colors.white : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
