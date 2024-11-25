import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/product_category_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryProduct> _categories = [];
  List<String> _categories1 = [];

  List<CategoryProduct> get categories => _categories;
  List<String> get categories1 => _categories1;

  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;

  // Fetch categories from the database on initialization
  CategoryProvider() {}

  Future<void> addCategory(CategoryProduct C) async {
    try {
      await _sqlDb.insertCategotyP(C.toMap());
      _categories.add(C);
      print("category added to the DB");
    } catch (e) {
      print('Error adding category to DB: $e');
    }
  }

  Future<void> loadCategories() async {
    print('Loading categories...');
    try {
      final data = await _sqlDb.readData('SELECT * FROM categoryP');
      _categories = data.map((item) => CategoryProduct.fromMap(item)).toList();
      print('Categories loaded: $_categories');
      notifyListeners();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }
}
