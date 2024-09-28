import 'package:flutter/material.dart';

class TotalProvider with ChangeNotifier {
  double _total = 0.0;

  double get total => _total;

  void updateTotal(
      List<dynamic> selectedProducts,
      TextEditingController prixController,
      TextEditingController cartonController,
      TextEditingController pieceController) {
    _total = selectedProducts.fold(
      0.0,
      (sum, item) {
        double prixAchat = double.tryParse(prixController.text) ?? 0;
        int cartonNumber = (item['cartonNumber'] as int? ?? 0);
        int cartonQty = int.tryParse(cartonController.text) ?? 0;
        int pieces = int.tryParse(pieceController.text) ?? 0;
        double currentPrice = prixAchat * (cartonNumber * cartonQty + pieces);

        return sum + currentPrice;
      },
    );

    notifyListeners(); // Notify listeners about the update
  }
}
