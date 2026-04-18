import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../widgets/bottom_navbar.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(currentIndex: 2, onTap: (i) {}),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
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
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: const [
                  ProductItem(
                    name: "Banana",
                    price: 7.2,
                    qty: 4,
                    image: "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmFuYW5hfGVufDB8fDB8fHww",
                    description: "Pisang segar pilihan dengan tingkat kematangan optimal, menghadirkan rasa manis alami dan tekstur lembut yang disukai semua kalangan. Buah ini cocok dinikmati langsung sebagai camilan sehat, diolah menjadi smoothie, topping sereal, hingga bahan utama berbagai olahan kue dan dessert. Kandungan kalium yang tinggi membantu menjaga energi tubuh dan mendukung aktivitas harian Anda. Dipilih langsung dari kebun berkualitas, pisang ini siap menjadi pilihan praktis dan bergizi untuk keluarga.",
                  ),
                  ProductItem(
                    name: "Broccoli",
                    price: 6.3,
                    qty: 1,
                    image: "https://plus.unsplash.com/premium_photo-1702403157830-9df749dc6c1e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnJvY29sbGl8ZW58MHx8MHx8fDA%3D",
                    description: "Brokoli hijau segar dengan tekstur renyah dan warna yang cerah, menandakan kualitas dan kesegaran terbaik. Sayuran ini dikenal sebagai sumber vitamin C, serat, dan antioksidan yang baik untuk menjaga daya tahan tubuh. Cocok diolah menjadi berbagai hidangan seperti tumis, sup, salad, hingga menu diet sehat sehari-hari. Dengan rasa yang ringan dan mudah dipadukan dengan berbagai bahan, brokoli menjadi pilihan tepat untuk melengkapi pola makan bergizi seimbang.",
                  ),
                  ProductItem(
                    name: "Grapes",
                    price: 5.7,
                    qty: 2,
                    image: "https://images.unsplash.com/photo-1631299106224-aae61c217164?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3JhcGVzfGVufDB8fDB8fHww",
                    description: "Anggur segar dengan kualitas premium, menawarkan rasa manis yang seimbang dengan sedikit sentuhan asam yang menyegarkan. Memiliki tekstur juicy dan kulit yang tipis, sehingga nyaman dinikmati langsung tanpa perlu banyak persiapan. Cocok sebagai camilan sehat, campuran salad buah, jus, maupun pelengkap hidangan penutup. Kaya akan vitamin dan antioksidan, anggur ini tidak hanya lezat tetapi juga mendukung gaya hidup sehat Anda sehari-hari.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
