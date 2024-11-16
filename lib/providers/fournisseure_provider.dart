import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class FournisseureProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;
  List<Fournisseure> _fournisseurs = [];
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

  /*List<Fournisseure> getFournisseureByCategory(String category) {
    return _fournisseurs.where((f) => f.category == category).toList();
  }*/

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
}
