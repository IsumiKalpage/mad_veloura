import 'package:flutter/material.dart';
import 'package:mad_veloura/screens/home.dart';
import 'package:mad_veloura/screens/products.dart';
import 'package:mad_veloura/screens/cart.dart';
import 'package:mad_veloura/screens/profile.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductsScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: isDark ? Colors.black : Colors.white,
        selectedItemColor: const Color(0xFF744545), // maroon for both themes
        unselectedItemColor: isDark ? Colors.white : Colors.grey[600],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
