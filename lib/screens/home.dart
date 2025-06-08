import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(), 
      body: SingleChildScrollView( 
        child: Container(
          color: Colors.white,  // Ensures the background of the entire screen is white
          child: Column(
            children: [
              Image.asset(
                'assets/images/banner.png', 
                width: double.infinity, 
                height: 200, 
                fit: BoxFit.cover, 
              ),
              const SizedBox(height: 20), 
          
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
              const NewArrivalsGrid(),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Japanese Hair Care',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'GLOSSY HAIR STARTS HERE\n\n'
                      'Transform dry, color treated, or unmanageable hair with our bestselling repair set powered by Royal Jelly and deep moisture-lock technology. Tame frizz, restore shine, and enjoy salon-soft results with zero salon appointments and zero stress. Trusted by 100,000+ women worldwide.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    
                    Image.asset(
                      'assets/images/jap.webp', 
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text(
                        'Shop Now',
                        style: TextStyle(
                          color: Colors.white, 
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 183, 136, 136), 
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewArrivalsGrid extends StatelessWidget {
  const NewArrivalsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imagePath: 'assets/images/airy.webp',
        title: 'Hince Second Skin Airy Powder',
        price: 'Rs. 7,750.00',
        rating: 4.5,
      ),
      Product(
        imagePath: 'assets/images/aha.webp',
        title: 'The Ordinary AHA 30% + BHA 2% Peeling Solution',
        price: 'Rs. 6,350.00',
        rating: 5.0,
      ),
      Product(
        imagePath: 'assets/images/BOJ.webp',
        title: 'Beauty of Joseon Revive eye serum : Ginseng + Retinal 30ml',
        price: 'Rs. 5,250.00',
        rating: 5.0,
      ),
      Product(
        imagePath: 'assets/images/lip.webp',
        title: 'Heimish Dailism Lip Gloss',
        price: 'Rs. 4,250.00',
        rating: 4.0,
      ),
    ];

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(), 
      shrinkWrap: true, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 0.75, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
      ),
      itemCount: products.length, 
      itemBuilder: (context, index) {
        return NewProductItem(
          imagePath: products[index].imagePath,
          title: products[index].title,
          price: products[index].price,
          rating: products[index].rating,
        );
      },
    );
  }
}

class Product {
  final String imagePath;
  final String title;
  final String price;
  final double rating;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
  });
}

class NewProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final double rating;

  const NewProductItem({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 180, 
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 88, 19, 39),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
