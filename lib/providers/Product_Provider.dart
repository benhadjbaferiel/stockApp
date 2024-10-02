import 'package:flutter/material.dart';
import '/Models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _deletedProducts = [];
  // Using private list

  List<Product> get products => _products;
  List<Product> get deletedProducts => _deletedProducts;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  void deleteProduct(Product product) {
    _products.remove(product);
    _deletedProducts.add(product);
    notifyListeners();
  }

  void restoreProduct(Product product) {
    _deletedProducts.remove(product);
    _products.add(product);
    notifyListeners();
  }

  void permanentlyDeleteProduct(Product product) {
    _deletedProducts.remove(product);
    notifyListeners();
  }
}
