import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class ProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      title: const Text(
        "User",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}