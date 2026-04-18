import 'package:flutter/material.dart';
import '../pages/product_detail_page.dart';
import 'quantity_selector.dart';

class ProductItem extends StatefulWidget {
  final String name;
  final double price;
  final int qty;
  final String image;
  final String description;

  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.qty,
    required this.image,
    required this.description,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late int qty;

  @override
  void initState() {
    qty = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double total = qty * widget.price;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ProductDetailPage(name: widget.name, price: widget.price, image: widget.image, description: widget.description),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // 🔥 IMAGE NETWORK (SUDAH DIPERBAIKI)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,

                // loading indicator
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },

                // kalau error
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "\$${total.toStringAsFixed(1)}",
                    style: const TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ),
            ),

            QuantitySelector(
              qty: qty,
              onChanged: (val) {
                setState(() {
                  qty = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
