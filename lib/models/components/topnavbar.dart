import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopNavbar({Key? key}) 
      : preferredSize = const Size.fromHeight(60.0), // Set the preferred height for the AppBar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Set AppBar background to white
      elevation: 0, // Remove shadow of AppBar
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color(0xFF744545), // Set the hamburger menu icon color to #744545
        ),
        onPressed: () {
          // Empty onPressed, as the hamburger menu doesn't do anything
          print("Hamburger menu clicked, but no action.");
        },
      ),
      title: Center(
        child: Image.asset(
          'assets/images/logo.png', // Your logo asset
          height: 40, // Adjust logo size
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Color(0xFF744545), // Set the profile icon color to #744545
            size: 30, // Profile icon size
          ),
          onPressed: () {
            // Add action for profile icon (navigate to profile or show dialog)
            print("Profile Icon Clicked");
          },
        ),
      ],
    );
  }
}
