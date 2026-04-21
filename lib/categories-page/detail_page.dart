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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String name = args['name'];
    final String price = args['price'];
    final String image = args['image'];

    final double priceValue = double.parse(price.replaceAll('\$', ''));
    final double totalPrice = priceValue * quantity;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            /// ================= IMAGE =================
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: _buildImage(image),
                ),

                Positioned(
                  top: 10,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            /// ================= CONTENT =================
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FRUITS',
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.outline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              name,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// PRICE + QTY
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${priceValue.toStringAsFixed(1)}',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                _qtySelector(colorScheme),
                              ],
                            ),

                            const SizedBox(height: 10),

                            /// RATING
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange),
                                const SizedBox(width: 5),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '(128 reviews)',
                                  style: TextStyle(color: colorScheme.outline),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// TAB
                            Row(
                              children: [
                                _buildTab(context, 'Description', 0),
                                _buildTab(context, 'Review', 1),
                                _buildTab(context, 'Discussion', 2),
                              ],
                            ),

                            const SizedBox(height: 10),

                            if (selectedTab == 0) _description(colorScheme),
                            if (selectedTab == 1) _review(colorScheme),
                            if (selectedTab == 2) _discussion(colorScheme),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    /// BUTTON
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                            },
                            child: Text(
                              'ADD TO CART  \$${totalPrice.toStringAsFixed(1)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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

  /// ================= IMAGE HANDLER =================
  Widget _buildImage(String image) {
    final isNetwork = image.startsWith('http');

    final placeholder = Container(
      color: Colors.grey[200],
      child: const Center(child: Icon(Icons.image)),
    );

    if (isNetwork) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => placeholder,
      );
    } else {
      return Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => placeholder,
      );
    }
  }

  /// ================= QTY =================
  Widget _qtySelector(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: colorScheme.onSurface),
            onPressed: () {
              setState(() {
                if (quantity > 1) quantity--;
              });
            },
          ),
          Text('$quantity'),
          IconButton(
            icon: Icon(Icons.add, color: colorScheme.onSurface),
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      ),
    );
  }

  /// ================= TAB =================
  Widget _buildTab(BuildContext context, String title, int index) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: selectedTab == index
                    ? colorScheme.primary
                    : colorScheme.outline,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 2,
              width: 60,
              color: selectedTab == index
                  ? colorScheme.primary
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _description(ColorScheme colorScheme) => Text(
    'Buah yang menyehatkan.',
    style: TextStyle(color: colorScheme.outline),
  );

  Widget _review(ColorScheme colorScheme) =>
      Text('Kualitas premium.', style: TextStyle(color: colorScheme.outline));

  Widget _discussion(ColorScheme colorScheme) =>
      Text('Belum ada diskusi.', style: TextStyle(color: colorScheme.outline));
}
