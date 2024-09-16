import 'package:flutter/material.dart';
import '../Models/product_category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryProduct> _categories = [];

  List<CategoryProduct> get categories => _categories;

  void addCategory(CategoryProduct category) {
    _categories.add(category);
    notifyListeners();
  }
}
