import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/product.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>((ref) {
  return CartStateNotifier();
});

class CartStateNotifier extends StateNotifier<List<Product>> {
  // CartStateNotifier(super.state);
  CartStateNotifier() : super([]);

  // can't modify state, so using cascading ,
  //create new list and set to it
  void addProduct(Product product) {
    state = [...state, product];
  }

  // void removeProduct(Product product) {
  //   _cart.remove(product);
  //   notifyListeners();
  // }

  void clearCart() {
    state = [];
  }
}
