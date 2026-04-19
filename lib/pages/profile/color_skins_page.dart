import 'package:flutter/material.dart';
import '../../theme/theme_controller.dart';

class ColorSkinsPage extends StatefulWidget {
  const ColorSkinsPage({super.key});

  @override
  State<ColorSkinsPage> createState() => _ColorSkinsPageState();
}

class _ColorSkinsPageState extends State<ColorSkinsPage> {
  late TextEditingController _hexController;

  final List<Map<String, dynamic>> colorThemes = [
    {'name': 'Red', 'color': const Color(0xFFD32F2F)},
    {'name': 'Green', 'color': const Color(0xFF388E3C)},
    {'name': 'Blue', 'color': const Color(0xFF1976D2)},
    {'name': 'Pink', 'color': const Color(0xFFC2185B)},
    {'name': 'Yellow', 'color': const Color(0xFFFBC02D)},
    {'name': 'Orange', 'color': const Color(0xFFF57C00)},
    {'name': 'Purple', 'color': const Color(0xFF7B1FA2)},
    {'name': 'DeepPurple', 'color': const Color(0xFF512DA8)},
    {'name': 'LightBlue', 'color': const Color(0xFF0288D1)},
    {'name': 'Teal', 'color': const Color(0xFF00796B)},
    {'name': 'Lime', 'color': const Color(0xFFC0CA33)},
    {'name': 'Deeporange', 'color': const Color(0xFFE64A19)},
  ];

  @override
  void initState() {
    super.initState();
    _hexController = TextEditingController(
      text: ThemeController.primaryColor.value
          .value
          .toRadixString(16)
          .toUpperCase()
          .padLeft(8, '0'),
    );
  }

  @override
  void dispose() {
    _hexController.dispose();
    super.dispose();
  }

  void _updateThemeColor(Color color) {
    ThemeController.primaryColor.value = color;
    _hexController.text = color.value.toRadixString(16).toUpperCase().padLeft(8, '0');
  }

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
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Color Themes",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Center(
                      child: Text(
                        "Link",
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // COLOR THEMES TITLE
                  Text(
                    "Color Themes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // LAYOUT THEMES TITLE
                  Text(
                    "Layout Themes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9E6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: ThemeController.isDark,
                          builder: (context, isDarkInner, _) {
                            return Text(
                              "Framework7 comes with 2 main layout themes: Light (default) and Dark:",
                              style: TextStyle(
                                fontSize: 13,
                                color: isDarkInner ? Colors.white : Colors.black,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // LIGHT
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  ThemeController.isDark.value = false;
                                },
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: !isDark ? Colors.green : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: !isDark
                                      ? const Align(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.check_circle,
                                              color: Colors.green, size: 28),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // DARK
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  ThemeController.isDark.value = true;
                                },
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1a1a1a),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isDark ? Colors.green : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: isDark
                                      ? const Align(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.check_circle,
                                              color: Colors.green, size: 28),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // DEFAULT COLOR THEMES TITLE
                  Text(
                    "Default Color Themes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // DEFAULT COLOR THEMES SECTION
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9E6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        ValueListenableBuilder(
                          valueListenable: ThemeController.isDark,
                          builder: (context, isDarkInner, _) {
                            return Text(
                              "Framework7 comes with 12 color themes set.",
                              style: TextStyle(
                                fontSize: 13,
                                color: isDarkInner ? Colors.white : Colors.black,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        // COLOR THEME BUTTONS - 3 COLUMNS GRID
                        Column(
                          children: [
                            for (int i = 0; i < colorThemes.length; i += 3)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (int j = 0; j < 3; j++)
                                      if (i + j < colorThemes.length)
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _updateThemeColor(colorThemes[i + j]['color']),
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: colorThemes[i + j]['color'],
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: primaryColor ==
                                                          colorThemes[i + j]['color']
                                                      ? Border.all(
                                                          color: Colors.white,
                                                          width: 3,
                                                        )
                                                      : null,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    colorThemes[i + j]['name'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: colorThemes[i + j]['color']
                                                                  .computeLuminance() >
                                                              0.5
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      else
                                        Expanded(child: Container()),
                                    if ((colorThemes.length - i) < 3)
                                      for (int k = 0; k < (3 - (colorThemes.length - i)); k++)
                                        Expanded(child: Container()),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CUSTOM COLOR THEME TITLE
                  Text(
                    "Custom Color Theme",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // CUSTOM COLOR THEME SECTION
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE9D7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              // COLOR PREVIEW
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // HEX INPUT
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "HEX Color",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    TextField(
                                      controller: _hexController,
                                      onChanged: (value) {
                                        try {
                                          if (value.isNotEmpty) {
                                            final hexColor = value.startsWith('#')
                                                ? value.substring(1)
                                                : value;
                                            final color = Color(
                                              int.parse('FF$hexColor', radix: 16),
                                            );
                                            _updateThemeColor(color);
                                          }
                                        } catch (e) {
                                          // Invalid hex format
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "#cddc39",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(horizontal: 12),
                                        isDense: true,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                color: isDark ? const Color(0xFF1a1a1a) : const Color(0xFFFFF9E6),
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: isDark ? Colors.grey[400] : Colors.black87,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Inbox",
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark ? Colors.grey[400] : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: isDark ? Colors.grey[400] : Colors.black87,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Calendar",
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark ? Colors.grey[400] : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: isDark ? Colors.grey[400] : Colors.black87,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Upload",
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark ? Colors.grey[400] : Colors.black87,
                          ),
                        ),
                      ],
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