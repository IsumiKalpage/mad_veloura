import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';
import 'package:mad_veloura/models/cart/cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartManager _cartManager = CartManager();
  final Map<String, int> _quantities = {};

  @override
  void initState() {
    super.initState();
    for (var item in _cartManager.cartItems) {
      _quantities[item.name] = (_quantities[item.name] ?? 1);
    }
  }

  void _incrementQuantity(String name) {
    setState(() {
      _quantities[name] = (_quantities[name] ?? 1) + 1;
    });
  }

  void _decrementQuantity(String name) {
    setState(() {
      if ((_quantities[name] ?? 1) > 1) {
        _quantities[name] = (_quantities[name] ?? 1) - 1;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      final item = _cartManager.cartItems[index];
      _quantities.remove(item.name);
      _cartManager.removeItemAt(index);
    });
  }

  int _parsePrice(String priceString) {
    return int.tryParse(priceString.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
  }

  String _formatPrice(int price) {
    return 'LKR ${price.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}';
  }

  void _showCartSummary() {
    final cartItems = _cartManager.cartItems;
    int totalItems = 0;
    int totalCost = 0;

    for (var item in cartItems) {
      final quantity = _quantities[item.name] ?? 1;
      totalItems += quantity;
      totalCost += _parsePrice(item.price) * quantity;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ThemeController().isDarkMode ? Colors.grey[900] : Colors.white,
        title: Text('Cart Summary', style: TextStyle(color: ThemeController().isDarkMode ? Colors.white : Colors.black)),
        content: Text(
          'Total Items: $totalItems\nTotal Cost: ${_formatPrice(totalCost)}',
          style: TextStyle(color: ThemeController().isDarkMode ? Colors.white70 : Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: TextStyle(color: ThemeController().isDarkMode ? Colors.white : Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = _cartManager.cartItems;
    final isDark = ThemeController().isDarkMode;

    return Scaffold(
      appBar: TopNavbar(),
      backgroundColor: isDark ? Colors.black : Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: cartItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _showCartSummary,
              backgroundColor: const Color.fromARGB(255, 169, 121, 121),
              icon: const Icon(Icons.receipt_long),
              label: const Text('Cart Summary'),
            )
          : null,
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your Cart is Empty!',
                style: TextStyle(fontSize: 24, color: isDark ? Colors.white : Colors.black),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                final quantity = _quantities[item.name] ?? 1;
                final unitPrice = _parsePrice(item.price);
                final totalPrice = unitPrice * quantity;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: isDark ? Colors.grey[900] : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: AssetImage(item.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: isDark ? Colors.white : Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatPrice(totalPrice),
                          style: TextStyle(
                            color: isDark ? Colors.grey[300] : Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline, color: isDark ? Colors.white : Colors.black),
                              onPressed: () => _decrementQuantity(item.name),
                            ),
                            Text('$quantity', style: TextStyle(fontSize: 16, color: isDark ? Colors.white : Colors.black)),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline, color: isDark ? Colors.white : Colors.black),
                              onPressed: () => _incrementQuantity(item.name),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeItem(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
