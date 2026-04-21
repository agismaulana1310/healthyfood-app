import 'package:flutter/material.dart';
import 'sign_in_page.dart'; // Impor untuk navigasi ke halaman Login

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF51B036);
    const Color darkText = Color(0xFF133F43);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Logo Kede
              Container(
                width: 120, height: 120,
                decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(28)),
                child: const Icon(Icons.storefront_rounded, size: 70, color: Colors.white),
              ),
              const SizedBox(height: 16),
              
              // Nama Aplikasi
              Text('Kede', style: TextStyle(fontSize: 52, fontWeight: FontWeight.w900, color: darkText, letterSpacing: -1.5)),
              const Spacer(),
              
              // Judul & Subjudul
              Text('Welcome to Kede! Your\ngrocery application', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade800, height: 1.2)),
              const SizedBox(height: 16),
              const Text('Shop for fresh groceries from the comfort of your home\n. Fast, easy, and reliable, sed do eiusmod tempor', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.5)),
              const SizedBox(height: 32),
              
              // Indikator Halaman (Dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 24, height: 6, decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(4))),
                  const SizedBox(width: 8),
                  Container(width: 24, height: 6, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4))),
                  const SizedBox(width: 8),
                  Container(width: 24, height: 6, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4))),
                ],
              ),
              const SizedBox(height: 48),
              
              // Tombol GET STARTED
              SizedBox(
                width: double.infinity, height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Berpindah ke Halaman Login
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 0),
                  child: const Text('GET STARTED', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}