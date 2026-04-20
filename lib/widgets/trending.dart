import 'package:flutter/material.dart';
import 'product_card.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "title": "Avocado",
        "price": "\$6.7",
        "img": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYe-NnBRQOLO2tLZkUyiQ4LH0LPoBflFVtVg&s',

      },
      {
        "title": "Broccoli",
        "price": "\$8.7",
        "img": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj-tiBKMEOi6IlBI31zKf-k9mpgAOceezDaA&s'

      },
      {
        "title": "Tomatoes",
        "price": "\$4.9",
        "img": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0YYiMyh3OM_g_6HQlEDQ_2Eh6ksCg9-tyGQ&s',
      },
      {
        "title": "Grapes",
        "price": "\$7.2",
        "img":       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWNS0ut2GrjHs7fo9UZ9CrJHcsO9DmRXoAiA&s',

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
                "Trending Deals",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/category',
                    arguments: {
                      'name': 'Fruits',
                      'items': '87 Items',
                    },
                  );
                },
                child: const Icon(Icons.arrow_forward, color: Colors.green),
              ),
            ],
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, i) {
              final p = products[i];
              return ProductCard(
                title: p['title']!,
                price: p['price']!,
                image: p['img']!,
              );
            },
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/category',
                  arguments: {
                    'name': 'Fruits',
                    'items': '87 Items',
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "LOAD MORE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
