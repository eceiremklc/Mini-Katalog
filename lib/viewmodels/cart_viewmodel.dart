import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartViewModel extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get itemCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.values.fold(
    0,
    (sum, item) => sum + item.product.price * item.quantity,
  );

  bool isInCart(int productId) => _items.containsKey(productId);

  int quantityOf(int productId) => _items[productId]?.quantity ?? 0;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void decreaseQuantity(int productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
