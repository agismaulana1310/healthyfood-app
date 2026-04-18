import 'package:flutter/material.dart';
class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orange, size: 18),
        const SizedBox(width: 4),
        const Text("4.5"),
        const Text(" (128 reviews)", style: TextStyle(color: Colors.grey)),
        const Spacer(),
        Row(
          children: const [
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage("https://plus.unsplash.com/premium_photo-1664879730392-2c2ae24ccc4a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlJTIwc21pbGV8ZW58MHx8MHx8fDA%3D"),
            ),
            SizedBox(width: 4),
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlJTIwc21pbGV8ZW58MHx8MHx8fDA%3D"),
            ),
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1548213238-0da7521bd6e0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBlb3BsZSUyMHNtaWxlfGVufDB8fDB8fHww"),
            ),
          ],
        ),
      ],
    );
  }
}
