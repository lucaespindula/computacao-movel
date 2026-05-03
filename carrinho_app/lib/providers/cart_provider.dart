import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  int get totalItems => _products.length;

  double get totalPrice {
    double total = 0;
    for (var product in _products) {
      total += product.preco;
    }
    return total;
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }
}
