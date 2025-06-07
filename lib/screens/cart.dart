import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; // Import the TopNavbar

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(), // Use the TopNavbar in the appBar
      body: const Center(
        child: Text(
          'Your Cart is Empty!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
