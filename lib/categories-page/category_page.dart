import 'package:flutter/material.dart';
import 'categories_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String searchQuery = '';

  List<Map<String, dynamic>> products = [
    {
      'name': 'Avocado',
      'price': '\$6.7',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYe-NnBRQOLO2tLZkUyiQ4LH0LPoBflFVtVg&s',
      'isFavorite': false,
    },
    {
      'name': 'Broccoli',
      'price': '\$8.7',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj-tiBKMEOi6IlBI31zKf-k9mpgAOceezDaA&s',
      'isFavorite': false,
    },
    {
      'name': 'Tomatoes',
      'price': '\$4.9',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0YYiMyh3OM_g_6HQlEDQ_2Eh6ksCg9-tyGQ&s',
      'isFavorite': false,
    },
    {
      'name': 'Grapes',
      'price': '\$7.2',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWNS0ut2GrjHs7fo9UZ9CrJHcsO9DmRXoAiA&s',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String categoryName = args?['name'] ?? 'fruits';
    final String totalItems = args?['items'] ?? '87 items';

    final filteredProducts = products.where((product) {
      return product['name']
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              height: 180,
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ICON ATAS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BACK
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),

                      // TUNE → KEMBALI KE CATEGORIES
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoriesPage(),
                            ),
                          );
                        },
                        child: const Icon(Icons.tune, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '$categoryName Category',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    totalItems,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            // ================= SEARCH =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // ================= GRID =================
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // OVERLAY
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ),

                      // LOVE BUTTON
                      Positioned(
                        top: 10,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              product['isFavorite'] =
                                  !product['isFavorite'];
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: product['isFavorite']
                                ? Colors.pink
                                : Colors.white,
                          ),
                        ),
                      ),

                      // TEXT (CLICKABLE)
                      Positioned(
                        bottom: 15,
                        left: 12,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: product,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product['price'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}