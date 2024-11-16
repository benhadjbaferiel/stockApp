import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/product_category_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryProduct> _categories = [];

  List<CategoryProduct> get categories => _categories;

  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;

  // Fetch categories from the database on initialization
  CategoryProvider() {
    fetchCategories();
  }

  Future<void> addCategory(CategoryProduct category) async {
    try {
      // Insert the category into the database
      String sql = 'INSERT INTO category (categoryName) VALUES (?)';
      int result = await _sqlDb.insertData(sql, [category.name]);

      if (result > 0) {
        // If insertion was successful, fetch the updated categories
        await fetchCategories();
      } else {
        print('Insertion failed. Result: $result');
      }
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  // Fetch categories from the database
  Future<void> fetchCategories() async {
    try {
      String sql = 'SELECT * FROM category';
      List<Map> response = await _sqlDb.readData(sql);

      _categories = response.map((cat) {
        return CategoryProduct(name: cat['categoryName'], products: []);
      }).toList();

      notifyListeners(); // Update the UI after fetching data
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle any errors here
    }
  }
}
