import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/sql_db.dart';

class FournisseureProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb();
  List<Fournisseure> _fournisseurs = [];
  List<String> _categories1 = ['---'];

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

  Future<void> loadFournisseurs() async {
    try {
      final data = await _sqlDb.readData('SELECT * FROM fournisseure');
      _fournisseurs = data.map((item) => Fournisseure.fromMap(item)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading fournisseurs: $e');
    }
  }

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

  Future<void> addFournisseur(Fournisseure fournisseur) async {
    try {
      await _sqlDb.insertFournisseur(fournisseur.toMap());
      await loadFournisseurs();
    } catch (e) {
      print('Error adding fournisseur: $e');
    }
  }

  List<Fournisseure> getFournisseureByCategory(String category) {
    if (category == '---') return _fournisseurs;
    return _fournisseurs
        .where((f) => f.categorie_id.toString() == category)
        .toList();
  }
}
