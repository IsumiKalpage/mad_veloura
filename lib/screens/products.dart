import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; 

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(),
      body: SingleChildScrollView( 
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              
              // SkinCare Section
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: _getSkinCareImageUrl(index),
                    name: _getSkinCareProductName(index),
                    price: _getSkinCareProductPrice(index),
                    rating: _getSkinCareProductRating(index),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              imageUrl: _getSkinCareImageUrl(index),
                              name: _getSkinCareProductName(index),
                              price: _getSkinCareProductPrice(index),
                              rating: _getSkinCareProductRating(index),
                              description: 'The AHA 30% + BHA 2% Peeling Solution is an at-home exfoliating facial that combines the power of alpha-hydroxy acids (AHA) and beta-hydroxy acids (BHA) to improve skin texture, reduce pore congestion, and address uneven skin tone. This high-strength peel is a recommended facial exfoliator for experienced users looking to achieve smoother, clearer skin. It features a Tasmanian pepperberry derivative, a known anti-irritant and is further supported with hyaluronic acid, pro-vitamin B5 and black carrot.',
                              features: 'Targets - Textural Irregularities, Dullness, Uneven Skin Tone',
                              brand: 'The Ordinary',
                              deliveryCharge: 'LKR 350',
                              authenticity: 'Guaranteed 100% Authentic Products',
                              origin: 'Imported from South Korea',
                              securePayments: 'Secure payments',
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              
              const SizedBox(height: 32), 
              
              // Cosmetics Section
              Text(
                'Cosmetics',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF744545),
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: _getCosmeticsImageUrl(index),
                    name: _getCosmeticsProductName(index),
                    price: _getCosmeticsProductPrice(index),
                    rating: _getCosmeticsProductRating(index),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              imageUrl: _getCosmeticsImageUrl(index),
                              name: _getCosmeticsProductName(index),
                              price: _getCosmeticsProductPrice(index),
                              rating: _getCosmeticsProductRating(index),
                              description: 'Glass-like gloss filled with moisture! Moisture Glow Lip Gloss',
                              features: 'Makes your lips glossy,Maintain vivid colors,Makes your lips glossy and fluffy',
                              brand: 'Hemish',
                              deliveryCharge: 'LKR 350',
                              authenticity: 'Guaranteed 100% Authentic Products',
                              origin: 'Imported from South Korea',
                              securePayments: 'Secure payments',
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              
              const SizedBox(height: 32), 
              
              // Hair & Body Section
              Text(
                'Hair & Body',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF744545),
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: _getHairBodyImageUrl(index),
                    name: _getHairBodyProductName(index),
                    price: _getHairBodyProductPrice(index),
                    rating: _getHairBodyProductRating(index),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              imageUrl: _getHairBodyImageUrl(index),
                              name: _getHairBodyProductName(index),
                              price: _getHairBodyProductPrice(index),
                              rating: _getHairBodyProductRating(index),
                              description: 'Nourish and cleanse dry, weak, or brittle hair with this scalp-tingling hair strengthening shampoo! Mielles Rosemary Mint Strengthening Shampoo was developed to gently cleanse your hair while providing key nutrients. With hair strengthening biotin and certified organic ingredients such as coconut and babassu seed oil, you can bring weak or brittle hair back from the brink.',
                              features: 'Infused with biotin to encourage growth, Gently cleanses and protects hair, Smells great!',
                              brand: 'Brand Name',
                              deliveryCharge: 'LKR 350',
                              authenticity: 'Guaranteed 100% Authentic Products',
                              origin: 'Imported from South Korea',
                              securePayments: 'Secure payments',
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SkinCare Products
  String _getSkinCareImageUrl(int index) {
    List<String> imageUrls = [
      'assets/images/aha.webp',
      'assets/images/anuaa.webp',
      'assets/images/anuac.webp',
      'assets/images/anuaF.webp',
    ];
    return imageUrls[index];
  }

  String _getSkinCareProductName(int index) {
    List<String> productNames = [
      'The Ordinary AHA 30% + BHA 2% Peeling Solution',
      'ANUA Niacinamide 10% + TXA 4% Dark Spot Correcting Serum 30ml',
      'ANUA Heartleaf Pore Control Cleansing Oil 200ml',
      'ANUA Heartleaf Quercetinol Pore Deep Cleansing Foam 150ml',
    ];
    return productNames[index];
  }

  String _getSkinCareProductPrice(int index) {
    List<String> productPrices = [
      'LKR 3,500', 
      'LKR 5,500', 
      'LKR 7,500',
      'LKR 8,500', 
    ];
    return productPrices[index];
  }

  double _getSkinCareProductRating(int index) {
    List<double> productRatings = [
      4.0,
      4.5,
      3.5,
      5.0,
    ];
    return productRatings[index];
  }

  // Cosmetics Products
  String _getCosmeticsImageUrl(int index) {
    List<String> imageUrls = [
      'assets/images/lip.webp',
      'assets/images/LAg.webp',
      'assets/images/mascara.webp',
      'assets/images/powder.webp',
    ];
    return imageUrls[index];
  }

  String _getCosmeticsProductName(int index) {
    List<String> productNames = [
      'Heimish Dailism Lip Gloss (Hemish)',
      'LA Girl PRO Conceal HD Concealer',
      'LA Girl Lift Off Mascara (LA Girl)',
      'Makeup Revolution Loose Baking Powder- Translucent',
    ];
    return productNames[index];
  }

  String _getCosmeticsProductPrice(int index) {
    List<String> productPrices = [
      'LKR 1,200', 
      'LKR 2,500', 
      'LKR 1,000',
      'LKR 700', 
    ];
    return productPrices[index];
  }

  double _getCosmeticsProductRating(int index) {
    List<double> productRatings = [
      4.0,
      4.7,
      3.8,
      4.3,
    ];
    return productRatings[index];
  }

  // Hair & Body Products
  String _getHairBodyImageUrl(int index) {
    List<String> imageUrls = [
      'assets/images/mielle.webp',
      'assets/images/rose.webp',
      'assets/images/cetaphil.webp',
      'assets/images/fino2.webp',
    ];
    return imageUrls[index];
  }

  String _getHairBodyProductName(int index) {
    List<String> productNames = [
      'Mielle Rosemary Mint Strengthening Shampoo',
      'Mielle Rosemary Mint Scalp & Hair Strengthening Oil',
      'Cetaphil Gentle Exfoliating SA Lotion 237ml',
      'Shiseido - Fino Premium Touch Shampoo 550ml',
    ];
    return productNames[index];
  }

  String _getHairBodyProductPrice(int index) {
    List<String> productPrices = [
      'LKR 800', 
      'LKR 1,200', 
      'LKR 1,500',
      'LKR 1,000', 
    ];
    return productPrices[index];
  }

  double _getHairBodyProductRating(int index) {
    List<double> productRatings = [
      4.2,
      4.6,
      3.9,
      4.5,
    ];
    return productRatings[index];
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final VoidCallback onTap;

  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
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
            Image.asset(
              imageUrl,
              width: double.infinity, 
              height: 200, 
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.5),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
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
                    onPressed: () {},
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

class ProductDetailPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final String description;
  final String features;
  final String brand;
  final String deliveryCharge;
  final String authenticity;
  final String origin;
  final String securePayments;

  const ProductDetailPage({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.features,
    required this.brand,
    required this.deliveryCharge,
    required this.authenticity,
    required this.origin,
    required this.securePayments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(imageUrl, width: 250, height: 250, fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Brand: $brand',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description),
              SizedBox(height: 16),
              Text(
                'Features:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(features),
              SizedBox(height: 16),
              Text(
                'Delivery Features:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Delivery Charge: $deliveryCharge'),
              Text('Authenticity: $authenticity'),
              Text('Origin: $origin'),
              Text('Secure Payments: $securePayments'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
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
      ),
    );
  }
}
