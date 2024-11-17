import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class FournisseureProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;
  List<Fournisseure> _fournisseurs = [];
  List<Fournisseure> fournisseursdeleted = [];
  List<String> _categories1 = ['---'];

  //-----------------------------------------------------

  void addFournisseur(Fournisseure fournisseur) {
    print('add fourniseur1');
    _fournisseurs.add(fournisseur);
    notifyListeners();
    addFournisseursToDb(fournisseur);
    loadFournisseurs();
  }

  List<Fournisseure> getSuppliersByCategory(int categoryId) {
    return _fournisseurs.where((f) => f.categorie_id == categoryId).toList();
  }

  Future<void> deleteFournisseur(String name) async {
    try {
      // Ensure the database is initialized
      await _sqlDb.intialDb();

      // Delete the fournisseur from the database
      int result = await _sqlDb.delete('fournisseure', 'nameF = ?', [name]);

      if (result > 0) {
        print('Fournisseur with name $name deleted successfully');

        // Reload fournisseurs to update the UI
        await loadFournisseurs();
      } else {
        print('No fournisseur found with ID $name');
      }
    } catch (e) {
      print('Error deleting fournisseur: $e');
    }
  }

  Future<void> deleteCategory(String categoryName) async {
    List<Map<String, dynamic>> categoryResult = await _sqlDb.rawQuery1(
      'SELECT idF FROM fournisseure_category WHERE categoryNameSuppliers = ?',
      [categoryName],
    );
    try {
      int categoryId = categoryResult.first['idF'];
      // Ensure the database is initialized
      await _sqlDb.intialDb();

      // Delete the category from the database
      int result =
          await _sqlDb.delete('fournisseure_category', 'idF = ?', [categoryId]);

      if (result > 0) {
        print('Category with ID $categoryId deleted successfully');

        // Reload categories and fournisseurs to update the UI
        await loadCategories();
        await loadFournisseurs();
      } else {
        print('No category found with ID $categoryId');
      }
    } catch (e) {
      print('Error deleting category: $e');
    }
  }

  //----get category id ----------------------------
  Future<int?> getCategoryId(String categoryName) async {
    try {
      await _sqlDb.intialDb();
      List<Map<String, dynamic>> result = await _sqlDb.rawQuery1(
        'SELECT idF FROM fournisseure_category WHERE categoryNameSuppliers = ?',
        [categoryName],
      );

      if (result.isNotEmpty) {
        return result.first['idF'];
      } else {
        print('Category $categoryName not found');
        return null;
      }
    } catch (e) {
      print('Error fetching category ID: $e');
      return null;
    }
  }
  //---------------------------------------------------

  Future<void> deleteSupplierbyCategory(String categoryName) async {
  try {
    // Ensure the database is initialized
    await _sqlDb.intialDb();

    // Step 1: Get the category ID for the given category name
    List<Map<String, dynamic>> categoryResult = await _sqlDb.rawQuery1(
      'SELECT idF FROM fournisseure_category WHERE categoryNameSuppliers = ?',
      [categoryName],
    );

    if (categoryResult.isEmpty) {
      print('Category not found');
      return;
    }

    int categoryId = categoryResult.first['idF'];
    print('Category ID for $categoryName: $categoryId');

    // Step 2: Delete suppliers with the corresponding category_id
    int deleteCount = await _sqlDb.delete(
      'fournisseure',
      'categorie_id = ?',
      [categoryId],
    );

    if (deleteCount > 0) {
      print('Successfully deleted $deleteCount suppliers for category $categoryName');
    } else {
      print('No suppliers found for category $categoryName');
    }

    // Reload categories and fournisseurs to update the UI
    await loadCategories();
    await loadFournisseurs();
  } catch (e) {
    print('Error deleting suppliers for category $categoryName: $e');
  }
}


// Assuming this is your delete method for suppliers

  //---------------------------------------------------------

  FournisseureProvider() {
    loadCategories();
    loadFournisseurs();
  }

  List<String> get categories1 => _categories1;
  List<Fournisseure> get getFournisseures => _fournisseurs;

  Future<void> loadCategories() async {
    print('load category');
    try {
      final data = await _sqlDb.readData('SELECT * FROM fournisseure_category');
      _categories1 = [
        '---',
        ...data.map((item) => item['categoryNameSuppliers'] as String)
      ];
      notifyListeners();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  Future<void> loadFournisseursByCategory(int categoryId) async {
    print('load fournisseur by category');
    try {
      final data = await _sqlDb.readData(
          'SELECT * FROM fournisseure WHERE categorie_id = ?', [categoryId]);
      _fournisseurs = data.map((item) => Fournisseure.fromMap(item)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading fournisseurs by category: $e');
    }
  }

  Future<void> loadFournisseurs() async {
    print('load fournisseur');
    try {
      _fournisseurs.clear();
      List<Map<String, dynamic>> result =
          await _sqlDb.rawQuery('SELECT * FROM fournisseure');

      print('Query result: $result');
      _fournisseurs = result.map((item) => Fournisseure.fromMap(item)).toList();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print('Error loading fournisseurs: $e');
    }
  }

  // Getter for fournisseurs list
  List<Fournisseure> get fournisseurs => _fournisseurs;

  Future<void> addCategory(String categoryName) async {
    print('add category');
    try {
      await _sqlDb.insertData(
          'INSERT INTO fournisseure_category (categoryNameSuppliers) VALUES (?)',
          [categoryName]);
      await loadCategories();
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  Future<void> addFournisseursToDb(Fournisseure fournisseur) async {
    try {
      await _sqlDb
          .insertFournisseur(fournisseur.toMap()); // Save the supplier in DB
      print("Supplier added to the DB");
    } catch (e) {
      print('Error adding fournisseur to DB: $e');
    }
  }

  List<Fournisseure> getFournisseureByCategory(String category) {
    if (category == '---') {
      return _fournisseurs;
    }

    int categoryId = _categories1.indexOf(category);
    return _fournisseurs.where((f) => f.categorie_id == categoryId).toList();
  }
  Future<List<Fournisseure>> getFournisseureByCategory1(String category) async {
  try {
    // If '---' is selected, return all suppliers
    if (category == '---') {
      return _fournisseurs;
    }

    // Get the category ID from the category name
    final categoryId = await getCategoryId(category);
    if (categoryId == null) {
      print('No category ID found for category: $category');
      return [];
    }

    // Query the database for all suppliers with the matching category_id
    final data = await _sqlDb.readData(
      'SELECT * FROM fournisseure WHERE categorie_id = ?',
      [categoryId],
    );

    // Map the result to a list of Fournisseure objects
    List<Fournisseure> suppliers = data.map((map) => Fournisseure.fromMap(map)).toList();

    // Optionally, update the in-memory list
    _fournisseurs = suppliers;

    return suppliers;
  } catch (e) {
    print('Error in getFournisseureByCategory: $e');
    return [];
  }
}


}
