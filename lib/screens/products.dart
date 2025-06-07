import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; // Import the TopNavbar

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(), // Use the TopNavbar in the appBar
      body: const Center(
        child: Text(
          'Here are the Products!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
