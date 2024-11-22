import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/product_category_model.dart';
import 'package:stock_dz_app/sql_db.dart';
import '/Models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _deletedProducts = [];
  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;

  // Using private list

  List<Product> get products => _products;
  List<Product> get deletedProducts => _deletedProducts;

  List<Product> getProductsByCategory(CategoryProduct category) {
    return _products.where((product) => product.category == category).toList();
  }

  ProductProvider() {
    fetchProducts();
  }
  // Fetch products from the database
  Future<void> fetchProducts() async {
    List<Map<String, dynamic>> data =
        await _sqlDb.readData('SELECT * FROM produits');
    _products = data
        .map((item) => Product.fromMap(item))
        .toList(); // Convert map to product model
    notifyListeners();
  }

  Future<void> addProductToDb(Product product) async {
    try {
      await _sqlDb.insertProduct(product.toMap()); // Save the supplier in DB
      print("product added to the DB");
    } catch (e) {
      print('Error adding product to DB: $e');
    }
  }

  // Delete product from the database
  Future<void> deleteProduct(Product product) async {
    await _sqlDb.deleteData('DELETE FROM produits WHERE id = ${product.id}');
    _products.remove(product);
    _deletedProducts.add(product);
    notifyListeners();
  }

  // Restore a deleted product
  Future<void> restoreProduct(Product product) async {
    _deletedProducts.remove(product);
    _products.add(product);
    notifyListeners();
  }

  // Permanently delete a product
  Future<void> permanentlyDeleteProduct(Product product) async {
    _deletedProducts.remove(product);
    notifyListeners();
  }

  Future<int?> getCategoryId(String categoryName) async {
    try {
      await _sqlDb.intialDb();
      List<Map<String, dynamic>> result = await _sqlDb.rawQuery1(
        'SELECT id8 FROM categoryP WHERE categoryPName = ?',
        [categoryName],
      );

      if (result.isNotEmpty) {
        return result.first['id8'];
      } else {
        print('Category $categoryName not found');
        return null;
      }
    } catch (e) {
      print('Error fetching category ID: $e');
      return null;
    }
  }

  Future<void> loadproducts() async {
    print('load products');
    try {
      _products.clear();
      List<Map<String, dynamic>> result =
          await _sqlDb.rawQuery('SELECT * FROM produits');

      print('Query result: $result');
      _products = result.map((item) => Product.fromMap(item)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading products: $e');
    }
  }
}
