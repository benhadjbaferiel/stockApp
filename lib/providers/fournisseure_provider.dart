import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class FournisseureProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb();
  Database? _db;
  List<Fournisseure> _fournisseurs = [];
  List<String> _categories1 = ['---', 'sba', 'oran', 'alger'];

  //-----------------------------------------------------

  void addFournisseur(Fournisseure fournisseur) {
    _fournisseurs.add(fournisseur);
    notifyListeners();
    addFournisseurs(_fournisseurs);
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
    try {
      final data = await _sqlDb.readData(
          'SELECT * FROM fournisseure WHERE categorie_id = ?', [categoryId]);
      _fournisseurs = data.map((item) => Fournisseure.fromMap(item)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading fournisseurs by category: $e');
    }
  }

  // Method to load all fournisseurs from the database
  Future<void> loadFournisseurs() async {
    try {
      if (_db == null) {
        print('Database is not initialized!');
        return;
      }

      // Execute query to get all fournisseurs
      List<Map<String, dynamic>> result =
          await _db!.rawQuery('SELECT * FROM fournisseure');

      // Map each row from the result to the Fournisseure model
      _fournisseurs = result.map((fournisseurData) {
        return Fournisseure.fromMap(fournisseurData);
      }).toList();

      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print('Error loading fournisseurs: $e');
    }
  }

  // Getter for fournisseurs list
  List<Fournisseure> get fournisseurs => _fournisseurs;

  Future<void> addCategory(String categoryName) async {
    try {
      await _sqlDb.insertData(
          'INSERT INTO fournisseure_category (categoryNameSuppliers) VALUES (?)',
          [categoryName]);
      await loadCategories();
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  Future<void> addFournisseurs(List<Fournisseure> fournisseurs) async {
    try {
      for (var fournisseur in fournisseurs) {
        await _sqlDb.insertFournisseur(fournisseur.toMap());
        print('added to the db');
      }
      await loadFournisseurs();
    } catch (e) {
      print('Error adding fournisseurs: $e');
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
