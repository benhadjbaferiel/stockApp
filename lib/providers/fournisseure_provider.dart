import 'package:flutter/material.dart';
import '/Models/fournisseure_model.dart';

class FournisseureProvider extends ChangeNotifier {
  List<String> _categories1 = ["---", "sidi bel abess", "Oran", "Alger"];
  List<String> get categoriess => _categories1;

  // Map to store clients by category
  Map<String, List<Fournisseure>> _fournisseuresByCategory = {};

  // Getter for clients by category
  List<Fournisseure> getFournisseureByCategory(String category) {
    return _fournisseuresByCategory[category] ?? [];
  }

  List<Fournisseure> get getFournisseures {
    return _fournisseuresByCategory.values
        .expand((element) => element)
        .toList();
  }

  void addCategory(String category) {
    _categories1.add(category);
    _fournisseuresByCategory[category] =
        []; // Initialize empty list for the new category
    notifyListeners();
  }

  void addFournisseure(Fournisseure fournisseure) {
    if (_fournisseuresByCategory.containsKey(fournisseure.categorie1)) {
      _fournisseuresByCategory[fournisseure.categorie1]?.add(fournisseure);
      notifyListeners();
    } else {
      // Handle case where category does not exist
      addCategory(fournisseure
          .categorie1); // Optionally add the category if it does not exist
      _fournisseuresByCategory[fournisseure.categorie1]?.add(fournisseure);
      notifyListeners();
    }
  }
}
