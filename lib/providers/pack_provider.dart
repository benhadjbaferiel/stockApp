import 'package:flutter/material.dart';
import '/Models/pack_model.dart';

class PackProvider with ChangeNotifier {
  List<Pack> _packs = [];

  List<Pack> get packs => _packs;

  void addPack(Pack pack) {
    _packs.add(pack);
    notifyListeners(); // Notify listeners about the change
  }
}
