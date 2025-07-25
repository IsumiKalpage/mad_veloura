import 'package:flutter/material.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopNavbar({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController().isDarkMode;

    return AppBar(
      backgroundColor: isDark ? Colors.black : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color(0xFF744545), 
        ),
        onPressed: () {
          print("Hamburger menu clicked, but no action.");
        },
      ),
      title: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Color(0xFF744545), 
          ),
          onPressed: () {
            print("Profile Icon Clicked");
          },
        ),
      ],
    );
  }
}
