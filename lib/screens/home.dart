import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController().isDarkMode;

    return Scaffold(
      appBar: TopNavbar(),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: isDark ? Colors.black : Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: isDark ? Colors.white : const Color.fromARGB(255, 235, 178, 178),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const NewArrivalsGrid(),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/sale.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'For You',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: isDark ? Colors.white : const Color.fromARGB(255, 235, 178, 178),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const ForYouGrid(),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/sale2.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Discounts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: isDark ? Colors.white : const Color.fromARGB(255, 235, 178, 178),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const DiscountsGrid(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String title;
  final String price;
  final String? discountedPrice;
  final double rating;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    this.discountedPrice,
    required this.rating,
  });
}

class NewArrivalsGrid extends StatelessWidget {
  const NewArrivalsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(imagePath: 'assets/images/cetaphil.webp', title: 'Cetaphil Gentle Exfoliating SA Lotion 237ml', price: 'Rs. 7,750.00', rating: 4.5),
      Product(imagePath: 'assets/images/LAg.webp', title: 'LA Girl PRO Conceal HD Concealer', price: 'Rs. 6,350.00', rating: 5.0),
      Product(imagePath: 'assets/images/mascara.webp', title: 'LA Girl Lift Off Mascara (LA Girl)', price: 'Rs. 5,250.00', rating: 5.0),
      Product(imagePath: 'assets/images/anuaF.webp', title: 'ANUA Heartleaf Quercetinol Pore Deep Cleansing Foam 150ml', price: 'Rs. 4,250.00', rating: 4.0),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDark = ThemeController().isDarkMode;
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return ProductItem(
              imagePath: p.imagePath,
              title: p.title,
              price: p.price,
              rating: p.rating,
              isDark: isDark,
            );
          },
        );
      },
    );
  }
}

class ForYouGrid extends StatelessWidget {
  const ForYouGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(imagePath: 'assets/images/airy.webp', title: 'Hince Second Skin Airy Powder', price: 'Rs. 7,750.00', rating: 4.5),
      Product(imagePath: 'assets/images/aha.webp', title: 'The Ordinary AHA 30% + BHA 2% Peeling Solution', price: 'Rs. 6,350.00', rating: 5.0),
      Product(imagePath: 'assets/images/BOJ.webp', title: 'Beauty of Joseon Revive eye serum : Ginseng + Retinal 30ml', price: 'Rs. 5,250.00', rating: 5.0),
      Product(imagePath: 'assets/images/lip.webp', title: 'Heimish Dailism Lip Gloss', price: 'Rs. 4,250.00', rating: 4.0),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDark = ThemeController().isDarkMode;
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return ProductItem(
              imagePath: p.imagePath,
              title: p.title,
              price: p.price,
              rating: p.rating,
              isDark: isDark,
            );
          },
        );
      },
    );
  }
}

class DiscountsGrid extends StatelessWidget {
  const DiscountsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(imagePath: 'assets/images/mask.webp', title: 'Mielle Rosemary Mint Hair Masque', price: 'Rs. 7,750.00', discountedPrice: 'Rs. 5,500.00', rating: 4.5),
      Product(imagePath: 'assets/images/lippie.webp', title: 'Hince Mood Enhancer Matte Lipstick', price: 'Rs. 6,350.00', discountedPrice: 'Rs. 4,500.00', rating: 5.0),
      Product(imagePath: 'assets/images/COSRX.webp', title: 'COSRX Acne Pimple Master Patch', price: 'Rs. 5,250.00', discountedPrice: 'Rs. 3,750.00', rating: 5.0),
      Product(imagePath: 'assets/images/Cosrx_Snail_Mucin.webp', title: 'COSRX Advanced Snail 96 Mucin', price: 'Rs. 4,250.00', discountedPrice: 'Rs. 3,000.00', rating: 4.0),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDark = ThemeController().isDarkMode;
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return DiscountProductItem(
              imagePath: p.imagePath,
              title: p.title,
              price: p.price,
              discountedPrice: p.discountedPrice ?? '',
              rating: p.rating,
              isDark: isDark,
            );
          },
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final double rating;
  final bool isDark;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[900] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 180, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: TextStyle(color: isDark ? Colors.white70 : const Color.fromARGB(255, 88, 19, 39))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(5, (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String discountedPrice;
  final double rating;
  final bool isDark;

  const DiscountProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.discountedPrice,
    required this.rating,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[900] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imagePath, height: 180, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                  child: const Text('SALE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(discountedPrice, style: TextStyle(color: isDark ? Colors.white : const Color.fromARGB(255, 88, 19, 39))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(5, (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
