import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stock_dz_app/sql_db.dart';
import '/Models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  final SqlDb _sqlDb = SqlDb();
  List<String> _categories = [];
  Map<String, List<Clientt>> _clientsByCategory = {};

  List<String> get categories => _categories;

  ClientProvider() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    await Future.wait([
      fetchCategories(),
      fetchClients(),
    ]);
  }

  // Charger les catégories depuis la base de données
  Future<void> fetchCategories() async {
    try {
      final List<Map<String, dynamic>> categoryData = await _sqlDb
          .readData('SELECT categoryNameClient FROM client_category');

      _categories = categoryData
          .map((item) => item['categoryNameClient'] as String)
          .toList();

      // Initialiser les listes vides pour chaque catégorie
      for (var category in _categories) {
        _clientsByCategory[category] ??= [];
      }

      notifyListeners();
    } catch (e) {
      print('Erreur lors du chargement des catégories: $e');
      // Gérer l'erreur de manière appropriée
    }
  }

  Future<void> fetchClients() async {
    try {
      final List<Map<String, dynamic>> data =
          await _sqlDb.readData('SELECT * FROM clients');

      // Réinitialiser les listes de clients par catégorie
      _clientsByCategory.clear();
      for (var category in _categories) {
        _clientsByCategory[category] = [];
      }

      // Convertir et catégoriser les clients
      for (var item in data) {
        final client = Clientt.fromMap(item);
        if (!_clientsByCategory.containsKey(client.categorie)) {
          _clientsByCategory[client.categorie] = [];
        }
        _clientsByCategory[client.categorie]?.add(client);
      }

      notifyListeners();
    } catch (e) {
      print('Erreur lors du chargement des clients: $e');
    }
  }

  Future<bool> addCategory(String category) async {
    try {
      // Check if the category exists in memory
      if (_categories.contains(category)) {
        print('Category already exists in memory: $category');
        return false;
      }

      // Check if the category exists in the database
      final List<Map<String, dynamic>> existingCategories =
          await _sqlDb.readData(
        "SELECT * FROM client_category WHERE categoryNameClient = ?",
        [category],
      );

      if (existingCategories.isNotEmpty) {
        print('Category already exists in database: $category');
        return false; // Category already exists
      }

      // Insert into the database
      final int result = await _sqlDb.insertData(
          "INSERT INTO client_category (categoryNameClient) VALUES (?)",
          [category]);
      print('Insert result: $result for category: $category');

      if (result > 0) {
        // Update memory only if insertion succeeded
        _categories.add(category);
        _clientsByCategory[category] = [];
        notifyListeners();
        print('Category added: $category');
        return true;
      }

      print('Failed to add category, result: $result');
      return false;
    } catch (e) {
      print('Error adding category: $e');
      return false;
    }
  }

  Future<void> addClient(Clientt client) async {
    try {
      // Vérifier et ajouter la catégorie si elle n'existe pas
      if (!_categories.contains(client.categorie)) {
        await addCategory(client.categorie);
      }

      // Insérer le client dans la base de données
      final result = await _sqlDb.insertData(
        """INSERT INTO clients 
           (Barcode, name, Price, NIF, AI, RC, NIS, phoneNumber, MAX, address, categorie, DAYS)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
        [
          client.barcode,
          client.name,
          client.Price,
          client.NIF,
          client.AI,
          client.RC,
          client.NIS,
          client.phoneNumber,
          client.MAX,
          client.address,
          client.categorie,
          client.DAYS,
        ],
      );

      if (result > 0) {
        // Mise à jour de la mémoire uniquement si l'insertion a réussi
        _clientsByCategory[client.categorie]?.add(client);
        notifyListeners();
      }
    } catch (e) {
      print('Erreur lors de l\'ajout du client: $e');
      rethrow;
    }
  }

  // Getters pour accéder aux données
  List<Clientt> getClientsByCategory(String category) {
    return _clientsByCategory[category] ?? [];
  }

  List<Clientt> get allClients {
    return _clientsByCategory.values.expand((element) => element).toList();
  }
}
