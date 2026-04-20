import 'package:flutter/material.dart';
import 'package:healthyfood_app/pages/write_review_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedMethod = "card";
  int selectedCardIndex = 0;

  final List<String> countries = [
    "Indonesia",
    "Malaysia",
    "Singapore",
    "Japan",
    "USA",
    "Germany",
  ];
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // HEADER
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),

              const SizedBox(height: 25),

              // STEP
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      circle(true),
                      const SizedBox(width: 8),
                      Expanded(child: line(true)),
                      const SizedBox(width: 8),
                      circle(true),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Text("Shipping Address", style: TextStyle(fontSize: 12)),
                      Spacer(),
                      Text(
                        "Payment Method",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // METHOD
              Row(
                children: [
                  Expanded(child: methodButton("cod")),
                  const SizedBox(width: 10),
                  Expanded(child: methodButton("card")),
                ],
              ),

              const SizedBox(height: 20),

              // CARD UI
              if (selectedMethod == "card")
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => selectedCardIndex = 0),
                        child: SizedBox(
                          width: 300,
                          child: cardUI(
                            selectedCardIndex == 0,
                            "45,662",
                            "**** **** **** 1234",
                            Colors.deepPurple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => setState(() => selectedCardIndex = 1),
                        child: SizedBox(
                          width: 300,
                          child: cardUI(
                            selectedCardIndex == 1,
                            "12,320",
                            "**** **** **** 5678",
                            Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              // 🔥 FORM (INI YANG DIUBAH)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👉 CARD FORM
                      if (selectedMethod == "card") ...[
                        input("Card Holder Name", "Samuel Witwicky"),
                        input("Card Number", "1234 5678 9101 1121"),

                        Row(
                          children: [
                            Expanded(child: input("Month/Year", "01/27")),
                            const SizedBox(width: 12),
                            Expanded(child: input("CVV", "123")),
                          ],
                        ),

                        const Text(
                          "Country",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),

                        DropdownButtonFormField<String>(
                          initialValue: selectedCountry,
                          isExpanded: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          hint: const Text("Choose your country"),
                          items: countries.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedCountry = val;
                            });
                          },
                        ),
                      ],

                      // 👉 COD FORM
                      if (selectedMethod == "cod") ...[
                        input("Address", "Address"),
                      ],

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WriteReviewPage()),
                    );
                  },
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // METHOD BUTTON
  Widget methodButton(String type) {
    bool isActive = selectedMethod == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isActive ? Colors.green : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            type == "card" ? "Credit Card" : "COD",
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // CARD UI
  Widget cardUI(bool selected, String balance, String number, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: selected
            ? [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: color.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Credit Card", style: TextStyle(color: Colors.white)),
              if (selected)
                const Icon(Icons.check_circle, color: Colors.white, size: 24),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "\$$balance",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // ignore: deprecated_member_use
          Text(number, style: TextStyle(color: Colors.white.withOpacity(0.8))),
        ],
      ),
    );
  }

  // INPUT
  Widget input(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circle(bool active) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: active
          ? Container(
              margin: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }

  Widget line(bool active) {
    return Container(height: 2, color: Colors.green);
  }
}
