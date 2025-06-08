import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; 

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Color(0xFF744545),
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'SkinCare',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF744545),
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
