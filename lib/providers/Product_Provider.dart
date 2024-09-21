import 'package:flutter/material.dart';
import '/Models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = []; // Using private list

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }
}
