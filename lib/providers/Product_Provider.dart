import 'package:flutter/material.dart';
import '/Models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> Products = [];
  void AddProduct(Product product) {
    Products.add(product);
    notifyListeners();
  }
}
