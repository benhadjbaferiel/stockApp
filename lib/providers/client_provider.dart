import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_dz_app/sql_db.dart';
import '/Models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb.instance;
  Database? _db;
  List<String> _categories = ['---', 'a', 'b'];
  List<Clientt> _clients = [];
  Map<String, List<Clientt>> _clientsByCategory = {};

  List<String> get categories => _categories;

  ClientProvider() {
    fetchCategories();
    fetchClients();
  }

  void addClients(Clientt client) {
    print('add client2 !');
    _clients.add(client);
    print('----------------------------------------------------');
    print('clients list : $_clients');
    notifyListeners();
    addClientsToDb(client);
    loadclients();
  }

  Future<void> loadclients() async {
    print('load client !');
    _clients.clear();
    List<Map<String, dynamic>> result =
        await _sqlDb.rawQuery('SELECT * FROM clients');

    print('Query result: $result');
    _clients = result.map((item) => Clientt.fromMap(item)).toList();
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      _sqlDb.intialDb();
      final data = await _sqlDb.readData('SELECT * FROM categoryC');
      _categories = [
        '---',
        ...data.map((item) => item['categoryName'] as String)
      ];
      notifyListeners();
    } catch (e) {
      print('Erreur lors du chargement des catégories: $e');
      // Gérer l'erreur de manière appropriée
    }
  }

  Future<void> fetchClients() async {
    try {
      _sqlDb.intialDb();
      final List<Map<String, dynamic>> data =
          await _sqlDb.readData('SELECT * FROM clients');

      // Réinitialiser les listes de clients par catégorie
      _clientsByCategory.clear();
      for (var category in _categories) {
        _clientsByCategory[category] = [];
      }
      notifyListeners();
    } catch (e) {
      print('Erreur lors du chargement des clients: $e');
    }
  }

  Future<void> addCategory(String categoryName) async {
    print('add category');
    try {
      await _sqlDb.insertData(
          'INSERT INTO categoryC (categoryName) VALUES (?)', [categoryName]);
      await loadCategories();
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  Future<void> addClientsToDb(Clientt client) async {
    print('add clients to db');
    try {
      await _sqlDb.insertClient(client.toMap()); // Save the supplier in DB
      print("Supplier added to the DB");
    } catch (e) {
      print('Error adding client to DB: $e');
    }
  }

  Future<void> loadCategories() async {
    print('load category');
    try {
      final data = await _sqlDb.readData('SELECT * FROM categoryC');
      _categories = [
        '---',
        ...data.map((item) => item['categoryName'] as String)
      ];
      notifyListeners();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  List<Clientt> getclientsByCategory(String category) {
    if (category == '---') {
      return _clients;
    }

    int categoryId = _categories.indexOf(category);
    return _clients.where((f) => f.idC == categoryId).toList();
  }

  // Getters pour accéder aux données
  Future<List<Clientt>> getclientsByCategory1(String category) async {
    try {
      // If '---' is selected, return all suppliers
      if (category == '---') {
        return _clients;
      }

      // Get the category ID from the category name
      final categoryId = await getCategoryId(category);
      if (categoryId == null) {
        print('No category ID found for category: $category');
        return [];
      }

      // Query the database for all suppliers with the matching category_id
      final data = await _sqlDb.readData(
        'SELECT * FROM clients WHERE idC = ?',
        [categoryId],
      );

      // Map the result to a list of Fournisseure objects
      List<Clientt> suppliers =
          data.map((map) => Clientt.fromMap(map)).toList();

      // Optionally, update the in-memory list
      _clients = suppliers;

      return suppliers;
    } catch (e) {
      print('Error in getclientsByCategory: $e');
      return [];
    }
  }

  List<Clientt> get allClients {
    return _clientsByCategory.values.expand((element) => element).toList();
  }

  Future<int?> getCategoryId(String categoryName) async {
    try {
      await _sqlDb.intialDb();
      List<Map<String, dynamic>> result = await _sqlDb.rawQuery1(
        'SELECT id3 FROM categoryC WHERE categoryName = ?',
        [categoryName],
      );

      if (result.isNotEmpty) {
        return result.first['id3'];
      } else {
        print('Category $categoryName not found');
        return null;
      }
    } catch (e) {
      print('Error fetching category ID: $e');
      return null;
    }
  }

  //------------------delete-------------------------------
  Future<void> deleteclient(String name) async {
    try {
      // Ensure the database is initialized
      await _sqlDb.intialDb();

      // Delete the fournisseur from the database
      int result = await _sqlDb.delete('clients', 'name = ?', [name]);

      if (result > 0) {
        print('Fournisseur with name $name deleted successfully');

        // Reload fournisseurs to update the UI
        await loadclients();
      } else {
        print('No fournisseur found with ID $name');
      }
    } catch (e) {
      print('Error deleting fournisseur: $e');
    }
  }

  Future<void> deleteClientsbyCategory(String categoryName) async {
    try {
      await _sqlDb.intialDb();
      List<Map<String, dynamic>> categoryResult = await _sqlDb.rawQuery1(
        'SELECT id3 FROM categoryC WHERE categoryName = ?',
        [categoryName],
      );

      if (categoryResult.isEmpty) {
        print('Category not found');
        return;
      }

      int categoryId = categoryResult.first['id3'];
      print('Category ID for $categoryName: $categoryId');
      int deleteCount = await _sqlDb.delete(
        'clients',
        'idC = ?',
        [categoryId],
      );

      if (deleteCount > 0) {
        print(
            'Successfully deleted $deleteCount suppliers for category $categoryName');
      } else {
        print('No suppliers found for category $categoryName');
      }
      await loadCategories();
      await loadclients();
    } catch (e) {
      print('Error deleting suppliers for category $categoryName: $e');
    }
  }

  Future<void> deleteCategory(String categoryName) async {
    List<Map<String, dynamic>> categoryResult = await _sqlDb.rawQuery1(
      'SELECT id3 FROM categoryC WHERE categoryName = ?',
      [categoryName],
    );
    try {
      int categoryId = categoryResult.first['id3'];
      await _sqlDb.intialDb();
      int result = await _sqlDb.delete('categoryC', 'id3 = ?', [categoryId]);

      if (result > 0) {
        print('Category with ID $categoryId deleted successfully');
        await loadCategories();
        await loadclients();
      } else {
        print('No category found with ID $categoryId');
      }
    } catch (e) {
      print('Error deleting category: $e');
    }
  }
}
