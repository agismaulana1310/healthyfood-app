import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      MaterialPageRoute(
                        builder: (_) => const CheckoutPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                ProductItem(name: "Avocado",
                price: 7.2,
                qty: 4,
                image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYe-NnBRQOLO2tLZkUyiQ4LH0LPoBflFVtVg&s',
                description: "Avocad premium ini dipanen pada tingkat kematangan yang optimal untuk memastikan tekstur daging buah yang lembut, pulen, dan cita rasa manis yang legit di lidah. Sebagai salah satu sumber kalium dan energi instan terbaik, pisang ini menjadi pilihan favorit bagi mereka yang memiliki gaya hidup aktif karena kepraktisannya untuk dikonsumsi kapan saja dan di mana saja. Selain lezat dinikmati secara langsung, pisang ini juga sangat ideal diolah menjadi berbagai menu sarapan bernutrisi seperti smoothie, oatmeal, hingga bahan dasar kue yang memberikan aroma harum alami.",),
                ProductItem(name: "Broccoli",
                price: 6.3,
                qty: 1,
                image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj-tiBKMEOi6IlBI31zKf-k9mpgAOceezDaA&s',
                description: "Hadirkan kualitas sayuran terbaik di meja makan Anda dengan brokoli hijau yang memiliki kuntum padat serta batang renyah yang penuh dengan nutrisi esensial. Sebagai salah satu superfood, brokoli ini mengandung serat, kalsium, dan berbagai vitamin penting yang diproses secara minimal untuk menjaga kesegarannya tetap terjaga hingga ke tangan Anda. Sayuran ini sangat fleksibel untuk diolah, mulai dari tumisan bawang putih yang gurih, dikukus untuk menjaga kandungan gizinya, hingga dicampurkan ke dalam sup hangat untuk memberikan tekstur dan warna yang menggugah selera keluarga.",
),
                ProductItem(
                  name: "Grapes",
                  price: 5.7,
                  qty: 2,
                  image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWNS0ut2GrjHs7fo9UZ9CrJHcsO9DmRXoAiA&s',
                  description:
                      "Nikmati sensasi kemewahan buah anggur pilihan yang memiliki perpaduan rasa manis alami dan sentuhan asam yang menyegarkan di setiap gigitannya. Setiap butirnya memiliki tekstur kulit yang garing dan tipis dengan daging buah yang sangat juicy, serta kaya akan kandungan antioksidan tinggi yang bermanfaat untuk menjaga daya tahan tubuh. Buah ini sangat cocok dijadikan sebagai camilan sehat berkelas di sela kesibukan Anda, bahan campuran salad yang estetik, maupun pendamping hidangan penutup yang mampu memberikan kesegaran instan secara alami.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}