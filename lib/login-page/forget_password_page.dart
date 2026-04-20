import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF51B036);
    const Color darkText = Color(0xFF133F43);
    
    // Menggunakan gambar latar belakang yang sama dengan halaman Login
    const String bgUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXmaJabjyuceLzxhj8K9w6QC1nVHmVZtmIuA&s';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Latar Belakang Gambar
          Image.network(
            bgUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
          ),
          
          // Panel Putih Melengkung
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60, // Ketinggian panel disesuaikan
              padding: const EdgeInsets.all(28.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Judul & Tombol Close
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Forget Password', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: darkText)),
                        IconButton(
                          icon: Icon(Icons.cancel, color: Colors.blueGrey.shade800, size: 30),
                          onPressed: () => Navigator.of(context).pop(), // Kembali ke Login
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Input Field: New Password
                    TextFormField(
                      obscureText: true, // Menyembunyikan teks karena ini password
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: primaryGreen, width: 2)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tombol SUBMIT
                    SizedBox(
                      width: double.infinity, height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi saat klik SUBMIT: Kembali ke halaman Login
                          Navigator.of(context).pop(); 
                          
                          // Opsional: Menampilkan pesan sukses di bawah layar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Password direset. Silakan login kembali.')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen, 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), 
                          elevation: 0
                        ),
                        child: const Text('SUBMIT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Teks Footer: Sign in to your registered account
                    Center(
                      child: Column(
                        children: [
                          const Text('Sign in to your registered account', style: TextStyle(color: Colors.black87, fontSize: 15)),
                          GestureDetector(
                            onTap: () {
                              // Kembali ke halaman login jika teks hijau ditekan
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text('Login here', style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}