import 'package:flutter/material.dart';
import 'sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              /// ================= LOGO =================
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.storefront_rounded,
                  size: 70,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              /// ================= APP NAME =================
              Text(
                'Kede',
                style: textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onBackground,
                  letterSpacing: -1.5,
                ),
              ),

              const Spacer(),

              /// ================= TITLE =================
              Text(
                'Welcome to Kede! Your\nGrocery Application',
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onBackground,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 16),

              /// ================= SUBTITLE =================
              Text(
                'Shop for fresh groceries from the comfort of your home. '
                'Fast, easy, and reliable.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.7),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              /// ================= DOT INDICATOR =================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(colorScheme.primary),
                  const SizedBox(width: 8),
                  _buildDot(colorScheme.outline.withOpacity(0.3)),
                  const SizedBox(width: 8),
                  _buildDot(colorScheme.outline.withOpacity(0.3)),
                ],
              ),

              const SizedBox(height: 48),

              /// ================= BUTTON =================
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
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

  /// ================= DOT WIDGET =================
  Widget _buildDot(Color color) {
    return Container(
      width: 24,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
