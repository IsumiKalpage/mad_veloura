import 'package:flutter/material.dart';
import 'package:mad_veloura/screens/home.dart'; // Home screen
import 'package:mad_veloura/screens/products.dart'; // Products screen
import 'package:mad_veloura/screens/cart.dart'; // Cart screen
import 'package:mad_veloura/screens/profile.dart'; // Profile screen


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0; // Track the current tab index

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductsScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  // Method to handle tab change
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Change tab on tap
        backgroundColor: Colors.white, // Set background to white
        selectedItemColor: Color(0xFF744545), // Selected icon color (#744545)
        unselectedItemColor: Colors.grey[600], // Unselected icon color (light black/gray)
        showSelectedLabels: true,
        showUnselectedLabels: true,
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