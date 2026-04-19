import 'package:flutter/material.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/rating_section.dart';
import '../widgets/tab_section.dart';
import '../widgets/review_item.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final double price;
  final String image;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.image,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: circleIcon(Icons.arrow_back),
                  ),
                ),

                Positioned(top: 40, right: 16, child: circleIcon(Icons.share)),
              ],
            ),

            // 🔥 CONTENT
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("FRUITS", style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 5),

                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: QuantitySelector(
                            qty: qty,
                            onChanged: (val) {
                              setState(() {
                                qty = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const RatingSection(),

                    const SizedBox(height: 15),

                    TabSection(
                      selectedTab: selectedTab,
                      onTap: (i) {
                        setState(() {
                          selectedTab = i;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (selectedTab == 0)
                              Text(
                                widget.description,
                                style: TextStyle(color: Colors.grey),
                              ),

                            if (selectedTab == 1) ...[
                              const ReviewItem(
                                name: "James Logan",
                                date: "27 August 2020",
                                comment:
                                    "mantap banget, rasanya enak dan segar. Recomended!",
                                rating: 4,
                                image: "https://plus.unsplash.com/premium_photo-1669704099116-a325b4d6186f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBlb3BsZSUyMHNtaWxlfGVufDB8fDB8fHww",
                              ),
                              const ReviewItem(
                                name: "Leo Tucker",
                                date: "15 June 2020",
                                comment:
                                    "ga bosen buat dimakan, apalagi pas panas-panas. Seger banget!",
                                rating: 5,
                                image: "https://images.unsplash.com/photo-1517677129300-07b130802f46?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHBlb3BsZSUyMHNtaWxlfGVufDB8fDB8fHww",
                              ),
                            ],  

                            if (selectedTab == 2)
                              const Text(
                                "Discussion content here...",
                                style: TextStyle(color: Colors.grey),
                              ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔥 BUTTON
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                         child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // 🔥 balik ke cart
                            },
                            child: Text(
                              "ADD TO CART \$${(widget.price * qty).toStringAsFixed(1)}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
