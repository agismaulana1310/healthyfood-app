import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF2D3748),
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF2D3748),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: const [
          NotificationCard(
            title: 'Apply Success',
            description:
                'You has apply an job in Queenify Group as UI Designer',
            time: '10h ago',
            dotColor: Color(0xFF2DD4BF), // Warna Cyan
          ),
          NotificationCard(
            title: 'Interview Calls',
            description: 'Congratulations! You have interview calls',
            time: '9h ago',
            // Tanpa dot indicator
          ),
          NotificationCard(
            title: 'Apply Success',
            description:
                'You has apply an job in Queenify Group as UI Designer',
            time: '8h ago',
            dotColor: Color(0xFF4ADE80), // Warna Hijau
          ),
          NotificationCard(
            title: 'Complete your profile',
            description:
                'Please verify your profile information to continue using this app',
            time: '7h ago',
            dotColor: Color(0xFF2DD4BF),
          ),
        ],
      ),
    );
  }
}

// === WIDGET KARTU NOTIFIKASI ===
class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final Color? dotColor;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Judul & Indikator
          Row(
            children: [
              if (dotColor != null) ...[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A202C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Teks Deskripsi
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4A5568),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),

          // Baris Bawah (Waktu & Tombol Mark as Read)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bagian Waktu
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Color(0xFFA0AEC0),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFA0AEC0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // Tombol Mark as read
              GestureDetector(
                onTap: () {
                  // Aksi ketika di klik "Mark as read"
                },
                child: const Text(
                  'Mark as read',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF48BB78), // Warna hijau untuk teks
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
