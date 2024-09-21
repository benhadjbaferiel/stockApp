import 'package:flutter/material.dart';
import '/Models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  List<String> _categories = [];
  List<String> get categories => _categories;

  // Map to store clients by category
  Map<String, List<Clientt>> _clientsByCategory = {};

  // Getter for clients by category
  List<Clientt> getClientsByCategory(String category) {
    return _clientsByCategory[category] ?? [];
  }

  List<Clientt> get getClient {
    return _clientsByCategory.values.expand((element) => element).toList();
  }

  void addCategory(String category) {
    _categories.add(category);
    _clientsByCategory[category] =
        []; // Initialize empty list for the new category
    notifyListeners();
  }

  void addClient(Clientt client) {
    if (_clientsByCategory.containsKey(client.categorie)) {
      _clientsByCategory[client.categorie]?.add(client);
      notifyListeners();
    } else {
      // Handle case where category does not exist
      addCategory(
          client.categorie); // Optionally add the category if it does not exist
      _clientsByCategory[client.categorie]?.add(client);
      notifyListeners();
    }
  }
}
