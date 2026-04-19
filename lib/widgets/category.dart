import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.apple,       
      Icons.eco,          
      Icons.restaurant_menu, 
      Icons.lunch_dining,
      Icons.bakery_dining,
      Icons.local_dining,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Categories", style: TextStyle(fontWeight: FontWeight.w600)),
              Icon(Icons.arrow_forward, color: Colors.green),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: icons.length,
              itemBuilder: (context, i) {
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
                  child: Icon(
                    icons[i],
                    color: i == 0 ? Colors.white : Colors.green,
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
