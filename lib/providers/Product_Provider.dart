import 'package:flutter/material.dart';
import 'package:stock_dz_app/sql_db.dart';
import '/Models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _deletedProducts = [];

  // Using private list

  List<Product> get products => _products;
  List<Product> get deletedProducts => _deletedProducts;
  final SqlDb sqlDb = SqlDb(); // Initialize SqlDb instance

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  ProductProvider() {
    fetchProducts();
  }
  // Fetch products from the database
  Future<void> fetchProducts() async {
    List<Map<String, dynamic>> data =
        await sqlDb.readData('SELECT * FROM produits');
    _products = data
        .map((item) => Product.fromMap(item))
        .toList(); // Convert map to product model
    notifyListeners();
  }

  // Add product to the database
  Future<void> addProduct(Product product) async {
    String sql = '''
      INSERT INTO produits 
      (number, name, prix1, prix2, prix3, prix4, prixachat, carton, quantity, category, notify, description, date, image_path) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';
    await sqlDb.insertData(sql, [
      product.number,
      product.name,
      product.prix1,
      product.prix2,
      product.prix3,
      product.prix4,
      product.prixAchat,
      product.carton,
      product.quantity,
      product.category,
      product.notify,
      product.description,
      product.date.toIso8601String(),
      product.image?.path,
    ]);
    _products.add(product); // Add product to the list
    notifyListeners();
  }

  // Delete product from the database
  Future<void> deleteProduct(Product product) async {
    await sqlDb.deleteData('DELETE FROM produits WHERE id = ${product.id}');
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
}
