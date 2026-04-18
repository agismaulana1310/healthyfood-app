import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/theme_controller.dart';
import '../../widgets/profile/profile_menu_item.dart';
import '../../widgets/routes/bottom_to_top_route.dart';
import 'profile_detail_page.dart';
import '../message/messages_page.dart';
import '../elements/elements_page.dart';
import 'color_skins_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.isDark,
      builder: (context, isDark, _) {
        return ValueListenableBuilder(
          valueListenable: ThemeController.primaryColor,
          builder: (context, primaryColor, __) {
            return Scaffold(
              backgroundColor: isDark ? const Color(0xFF0D1B0F) : const Color(0xFFF2F2F2),
              appBar: AppBar(
                backgroundColor: isDark ? const Color(0xFF1a1a1a) : AppColors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  "User",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      icon: Icons.person, // IKON UNTUK MY PROFILE
                      title: "MY PROFILE",
                      onTap: () {
                        Navigator.push(
                          context,
                          BottomToTopRoute(
                            page: const ProfileDetailPage(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.notifications, // IKON UNTUK NOTIFICATIONS
                      title: "NOTIFICATIONS",
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.message, // IKON UNTUK MESSAGE (lebih mewakili chat)
                      title: "MESSAGE",
                      onTap: () {
                        Navigator.push(
                          context,
                          BottomToTopRoute(
                            page: const MessagesPage(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.widgets, // IKON UNTUK ELEMENTS (alternatif grid)
                      title: "ELEMENTS",
                      onTap: () {
                        Navigator.push(
                          context,
                          BottomToTopRoute(
                            page: const ElementsPage(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.color_lens,
                      title: "COLOR SKINS",
                      onTap: () {
                        Navigator.push(
                          context,
                          BottomToTopRoute(
                            page: const ColorSkinsPage(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.logout, // IKON UNTUK LOGOUT
                      title: "LOGOUT",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: isDark ? const Color(0xFF1a1a1a) : Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.compare_arrows),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: const AssetImage("assets/images/profile.jpg"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}