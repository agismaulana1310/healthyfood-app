import 'package:flutter/material.dart';
import '../pages/cart_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  int selectedTab = 0;

  Widget _buildProductImage(String image) {
    if (image.startsWith('http://') || image.startsWith('https://')) {
      return Image.network(image, fit: BoxFit.cover);
    }

    return Image.asset(image, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String name = args['name'];
    final String price = args['price'];
    final String image = args['image'];

    final double priceValue =
        double.parse(price.replaceAll('\$', ''));

    final double totalPrice = priceValue * quantity;

    return Scaffold(
      backgroundColor: Colors.grey[200],

      // ================= BODY =================
      body: SafeArea(
        child: Column(
          children: [
            // ================= IMAGE =================
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: _buildProductImage(image),
                ),

                Positioned(
                  top: 10,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon:
                          const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            // ================= CONTENT =================
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),

                child: Column(
                  children: [
                    // ================= SCROLL AREA =================
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'FRUITS',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // PRICE + QTY
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${priceValue.toStringAsFixed(1)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity--;
                                            }
                                          });
                                        },
                                      ),
                                      Text('$quantity'),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // RATING
                            const Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange),
                                SizedBox(width: 5),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(128 reviews)',
                                  style:
                                      TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // ================= TAB =================
                            Row(
                              children: [
                                _buildTab('Description', 0),
                                _buildTab('Review', 1),
                                _buildTab('Discussion', 2),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // ================= CONTENT =================
                            if (selectedTab == 0) _description(),
                            if (selectedTab == 1) _review(),
                            if (selectedTab == 2) _discussion(),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    // ================= BUTTON (FIXED) =================
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.favorite,
                              color: Colors.white),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CartPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TAB =================
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: selectedTab == index
                    ? Colors.black
                    : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 2,
              width: 60,
              color: selectedTab == index
                  ? Colors.green
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  // ================= DESCRIPTION =================
  Widget _description() {
    return const Text(
      'Buah yang menyehatkan dan menyegarkan dengan kandungan vitamin yang di butuhkan oleh tubuh.',
      style: TextStyle(color: Colors.grey),
    );
  }

  // ================= REVIEW =================
  Widget _review() {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('James Logan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold)),
                Text('27 August 2020',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Icon(Icons.star,
                    color: Colors.orange, size: 16),
                Icon(Icons.star,
                    color: Colors.orange, size: 16),
                Icon(Icons.star,
                    color: Colors.orange, size: 16),
                Icon(Icons.star,
                    color: Colors.orange, size: 16),
                Icon(Icons.star_border, size: 16),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Buah dengan kualitas premium.',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  // ================= DISCUSSION =================
  Widget _discussion() {
    return const Text(
      'Belum ada diskusi.',
      style: TextStyle(color: Colors.grey),
    );
  }
}