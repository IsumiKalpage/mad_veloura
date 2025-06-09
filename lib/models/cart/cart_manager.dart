class CartItem {
  final String name;
  final String imageUrl;
  final String price;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
  }

  void removeItemAt(int index) {
    _cartItems.removeAt(index);
  }

  void clearCart() {
    _cartItems.clear();
  }

  bool isEmpty() => _cartItems.isEmpty;
}
