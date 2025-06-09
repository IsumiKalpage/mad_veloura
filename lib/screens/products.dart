import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart';
import 'package:mad_veloura/models/cart/cart_manager.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    int columns = orientation == Orientation.portrait ? 2 : 3;
    final isDark = ThemeController().isDarkMode;

    return Scaffold(
      appBar: TopNavbar(),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: isDark ? Colors.black : Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Products', isDark),
              _sectionTitle('SkinCare', isDark, small: true),
              _buildGrid(context, columns, _getSkinCareImageUrl, _getSkinCareProductName, _getSkinCareProductPrice, _getSkinCareProductRating, isDark),
              SizedBox(height: 32),
              _sectionTitle('Cosmetics', isDark, small: true),
              _buildGrid(context, columns, _getCosmeticsImageUrl, _getCosmeticsProductName, _getCosmeticsProductPrice, _getCosmeticsProductRating, isDark),
              SizedBox(height: 32),
              _sectionTitle('Hair & Body', isDark, small: true),
              _buildGrid(context, columns, _getHairBodyImageUrl, _getHairBodyProductName, _getHairBodyProductPrice, _getHairBodyProductRating, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, bool isDark, {bool small = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: small ? 16 : 20,
            fontWeight: small ? FontWeight.w400 : FontWeight.w200,
            color: isDark ? Colors.white : Color(0xFF744545),
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildGrid(
    BuildContext context,
    int columns,
    String Function(int) getImage,
    String Function(int) getName,
    String Function(int) getPrice,
    double Function(int) getRating,
    bool isDark,
  ) {
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
          isDark: isDark,
          onTap: index == 0
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        imageUrl: getImage(index),
                        name: getName(index),
                        brand: "ANUA",
                        price: getPrice(index),
                        rating: getRating(index),
                        description: "This exfoliating solution helps improve skin texture, unclog pores, and promote even tone.",
                        features: [
                          "30% AHA and 2% BHA formula",
                          "Targets dullness and congestion",
                          "Smooths skin texture",
                          "Minimizes pores",
                        ],
                      ),
                    ),
                  );
                }
              : null,
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

  String _getSkinCareImageUrl(int index) => [
    'assets/images/aha.webp',
    'assets/images/anuaa.webp',
    'assets/images/anuac.webp',
    'assets/images/anuaF.webp',
  ][index];

  String _getSkinCareProductName(int index) => [
    'The Ordinary AHA 30% + BHA 2% Peeling Solution',
    'ANUA Niacinamide 10% + TXA 4% Dark Spot Correcting Serum 30ml',
    'ANUA Heartleaf Pore Control Cleansing Oil 200ml',
    'ANUA Heartleaf Quercetinol Pore Deep Cleansing Foam 150ml',
  ][index];

  String _getSkinCareProductPrice(int index) => [
    'LKR 3,500',
    'LKR 5,500',
    'LKR 7,500',
    'LKR 8,500',
  ][index];

  double _getSkinCareProductRating(int index) => [4.0, 4.5, 3.5, 5.0][index];

  String _getCosmeticsImageUrl(int index) => [
    'assets/images/lip.webp',
    'assets/images/LAg.webp',
    'assets/images/mascara.webp',
    'assets/images/powder.webp',
  ][index];

  String _getCosmeticsProductName(int index) => [
    'Heimish Dailism Lip Gloss (Hemish)',
    'LA Girl PRO Conceal HD Concealer',
    'LA Girl Lift Off Mascara (LA Girl)',
    'Makeup Revolution Loose Baking Powder- Translucent',
  ][index];

  String _getCosmeticsProductPrice(int index) => [
    'LKR 1,200',
    'LKR 2,500',
    'LKR 1,000',
    'LKR 700',
  ][index];

  double _getCosmeticsProductRating(int index) => [4.0, 4.7, 3.8, 4.3][index];

  String _getHairBodyImageUrl(int index) => [
    'assets/images/mielle.webp',
    'assets/images/rose.webp',
    'assets/images/cetaphil.webp',
    'assets/images/fino2.webp',
  ][index];

  String _getHairBodyProductName(int index) => [
    'Mielle Rosemary Mint Strengthening Shampoo',
    'Mielle Rosemary Mint Scalp & Hair Strengthening Oil',
    'Cetaphil Gentle Exfoliating SA Lotion 237ml',
    'Shiseido - Fino Premium Touch Shampoo 550ml',
  ][index];

  String _getHairBodyProductPrice(int index) => [
    'LKR 800',
    'LKR 1,200',
    'LKR 1,500',
    'LKR 1,000',
  ][index];

  double _getHairBodyProductRating(int index) => [4.2, 4.6, 3.9, 4.5][index];
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final VoidCallback? onTap;
  final VoidCallback onAddToCart;
  final bool isDark;

  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
    required this.onAddToCart,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isDark ? Colors.grey[850] : Colors.white,
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
                  Text(name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8.5),
                  Text(price,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.grey[300] : Colors.grey,
                      )),
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
                    child: Text('Add to Cart', style: TextStyle(color: Colors.white)),
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

class ProductDetailPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String brand;
  final String price;
  final double rating;
  final String description;
  final List<String> features;

  const ProductDetailPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.description,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        elevation: 0,
        title: Text('Product Details', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
            const SizedBox(height: 8),
            Text('Brand: $brand', style: TextStyle(fontSize: 16, color: isDark ? Colors.white70 : Colors.grey[700])),
            const SizedBox(height: 8),
            Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFA97979))),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
            const SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 14, color: isDark ? Colors.white70 : Colors.black87)),
            const SizedBox(height: 16),
            Text('Features', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
            const SizedBox(height: 8),
            ...features.map((f) => Row(
              children: [
                const Icon(Icons.check, size: 16, color: Color(0xFFA97979)),
                const SizedBox(width: 8),
                Expanded(child: Text(f, style: TextStyle(color: isDark ? Colors.white70 : Colors.black))),
              ],
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA97979),
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
