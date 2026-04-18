import 'package:flutter/material.dart';
import 'payment_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool saveAddress = false;

  final List<String> countries = [
    "Indonesia",
    "Malaysia",
    "Singapore",
    "Japan",
    "USA",
    "Germany",
  ];

  String? selectedCountry = "USA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔙 HEADER
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

              // 🔥 STEP INDICATOR
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      circle(true),
                      const SizedBox(width: 8),
                      Expanded(child: line(true)),
                      const SizedBox(width: 8),
                      circle(false),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Text("Shipping Address"),
                      Spacer(),
                      Text(
                        "Payment Method",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 🔥 FORM
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      input("Full Name", "Ujang Kosim"),
                      input("Email Address", "info@example.com"),
                      input("Phone", "Enter your phone number"),

                      Row(
                        children: [
                          Expanded(child: input("Zip Code", "Enter here")),
                          const SizedBox(width: 12),
                          Expanded(child: input("City", "Enter here")),
                        ],
                      ),

                      // 🔥 DROPDOWN COUNTRY (FIXED)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Country"),
                            const SizedBox(height: 6),

                            DropdownButtonFormField<String>(
                              value: countries.contains(selectedCountry)
                                  ? selectedCountry
                                  : null,

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

                              items: countries.map((country) {
                                return DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                );
                              }).toList(),

                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Checkbox(
                            value: saveAddress,
                            onChanged: (val) {
                              setState(() {
                                saveAddress = val!;
                              });
                            },
                          ),
                          const Text("Save shipping address"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                 onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PaymentPage()),
                    );
                  },
                  child: const Text("NEXT", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 INPUT FIELD
  Widget input(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
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
          ),
        ],
      ),
    );
  }

  // 🔵 CIRCLE
  Widget circle(bool active) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: active ? Colors.green : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: active
          ? Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }

  // ➖ LINE
  Widget line(bool active) {
    return Container(
      height: 2,
      color: active ? Colors.green : Colors.grey.shade300,
    );
  }
}
