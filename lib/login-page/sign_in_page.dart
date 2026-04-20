import 'package:flutter/material.dart';
import 'create_account_page.dart'; // Impor untuk navigasi ke halaman Register
import 'forget_password_page.dart';
import '../pages/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF51B036);
    const Color darkText = Color(0xFF133F43);
    // URL Gambar Buah
    const String loginBgUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtWuGaBnLOhzG4wbUhFxtF9K0_HytXJJQOIA&s';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Latar Belakang Gambar
          Image.network(
            loginBgUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey[300]),
          ),

          // Panel Putih Melengkung
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.72,
              padding: const EdgeInsets.all(28.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: darkText,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.blueGrey.shade800,
                            size: 30,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Input Fields
                    _buildInput(hint: 'Enter your email'),
                    const SizedBox(height: 16),

                    _buildInput(hint: 'Enter your password', isPassword: true),
                    const SizedBox(height: 16),

                    // Lupa Password
                    // Lupa Password
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigasi ke halaman Forget Password
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Tombol
                    _buildButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      color: primaryGreen,
                    ),
                    const SizedBox(height: 16),
                    _buildButton(
                      text: 'CREATE AN ACCOUNT',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountPage(),
                        ),
                      ),
                      color: primaryGreen,
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

  // Widget Pembantu untuk mengurangi kode berulang
  Widget _buildInput({required String hint, bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF51B036), width: 2),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
