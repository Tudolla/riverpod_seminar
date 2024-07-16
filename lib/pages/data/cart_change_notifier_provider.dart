import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/product.dart';
import 'package:flutter/material.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addProduct(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
