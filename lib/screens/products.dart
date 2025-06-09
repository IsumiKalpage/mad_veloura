import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart';
import 'package:mad_veloura/models/cart/cart_manager.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    int columns = orientation == Orientation.portrait ? 2 : 3;

    return Scaffold(
      appBar: TopNavbar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Products'),
              _sectionTitle('SkinCare', small: true),
              _buildGrid(context, columns, _getSkinCareImageUrl, _getSkinCareProductName, _getSkinCareProductPrice, _getSkinCareProductRating),

              SizedBox(height: 32),
              _sectionTitle('Cosmetics', small: true),
              _buildGrid(context, columns, _getCosmeticsImageUrl, _getCosmeticsProductName, _getCosmeticsProductPrice, _getCosmeticsProductRating),

              SizedBox(height: 32),
              _sectionTitle('Hair & Body', small: true),
              _buildGrid(context, columns, _getHairBodyImageUrl, _getHairBodyProductName, _getHairBodyProductPrice, _getHairBodyProductRating),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {bool small = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: small ? 16 : 20,
            fontWeight: small ? FontWeight.w400 : FontWeight.w200,
            color: Color(0xFF744545),
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildGrid(BuildContext context, int columns,
    String Function(int) getImage,
    String Function(int) getName,
    String Function(int) getPrice,
    double Function(int) getRating) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.6,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl: getImage(index),
          name: getName(index),
          price: getPrice(index),
          rating: getRating(index),
          onTap: () {}, 
          onAddToCart: () {
            CartManager().addToCart(CartItem(
              name: getName(index),
              imageUrl: getImage(index),
              price: getPrice(index),
            ));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Added to cart')),
            );
          },
        );
      },
    );
  }

  // --- Existing Product Data Methods Below ---

  String _getSkinCareImageUrl(int index) {
    return [
      'assets/images/aha.webp',
      'assets/images/anuaa.webp',
      'assets/images/anuac.webp',
      'assets/images/anuaF.webp',
    ][index];
  }

  String _getSkinCareProductName(int index) {
    return [
      'The Ordinary AHA 30% + BHA 2% Peeling Solution',
      'ANUA Niacinamide 10% + TXA 4% Dark Spot Correcting Serum 30ml',
      'ANUA Heartleaf Pore Control Cleansing Oil 200ml',
      'ANUA Heartleaf Quercetinol Pore Deep Cleansing Foam 150ml',
    ][index];
  }

  String _getSkinCareProductPrice(int index) {
    return ['LKR 3,500', 'LKR 5,500', 'LKR 7,500', 'LKR 8,500'][index];
  }

  double _getSkinCareProductRating(int index) {
    return [4.0, 4.5, 3.5, 5.0][index];
  }

  String _getCosmeticsImageUrl(int index) {
    return [
      'assets/images/lip.webp',
      'assets/images/LAg.webp',
      'assets/images/mascara.webp',
      'assets/images/powder.webp',
    ][index];
  }

  String _getCosmeticsProductName(int index) {
    return [
      'Heimish Dailism Lip Gloss (Hemish)',
      'LA Girl PRO Conceal HD Concealer',
      'LA Girl Lift Off Mascara (LA Girl)',
      'Makeup Revolution Loose Baking Powder- Translucent',
    ][index];
  }

  String _getCosmeticsProductPrice(int index) {
    return ['LKR 1,200', 'LKR 2,500', 'LKR 1,000', 'LKR 700'][index];
  }

  double _getCosmeticsProductRating(int index) {
    return [4.0, 4.7, 3.8, 4.3][index];
  }

  String _getHairBodyImageUrl(int index) {
    return [
      'assets/images/mielle.webp',
      'assets/images/rose.webp',
      'assets/images/cetaphil.webp',
      'assets/images/fino2.webp',
    ][index];
  }

  String _getHairBodyProductName(int index) {
    return [
      'Mielle Rosemary Mint Strengthening Shampoo',
      'Mielle Rosemary Mint Scalp & Hair Strengthening Oil',
      'Cetaphil Gentle Exfoliating SA Lotion 237ml',
      'Shiseido - Fino Premium Touch Shampoo 550ml',
    ][index];
  }

  String _getHairBodyProductPrice(int index) {
    return ['LKR 800', 'LKR 1,200', 'LKR 1,500', 'LKR 1,000'][index];
  }

  double _getHairBodyProductRating(int index) {
    return [4.2, 4.6, 3.9, 4.5][index];
  }
}

//  ProductCard to accept `onAddToCart`
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Image.asset(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200), maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8.5),
                  Text(price, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
                  SizedBox(height: 9.0),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 17.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: onAddToCart,
                    child: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 169, 121, 121),
                      minimumSize: Size(double.infinity, 36),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
