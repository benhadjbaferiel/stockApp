import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Models/client_model.dart';
import 'package:stock_dz_app/providers/client_provider.dart';

class ClientSaved {
  final TextEditingController nameController;
  final TextEditingController barCodeController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController priceController;
  final TextEditingController nifController;
  final TextEditingController aiController;
  final TextEditingController rcController;
  final TextEditingController nisController;
  final TextEditingController maxController;
  final TextEditingController daysController;
  final TextEditingController categoryController;

  ClientSaved({
    required this.nameController,
    required this.barCodeController,
    required this.addressController,
    required this.phoneController,
    required this.priceController,
    required this.nifController,
    required this.aiController,
    required this.rcController,
    required this.nisController,
    required this.maxController,
    required this.daysController,
    required this.categoryController,
  });

  void saveClient(BuildContext context) {
    if (nameController.text.isEmpty ||
        barCodeController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneController.text.isEmpty ||
        nifController.text.isEmpty ||
        aiController.text.isEmpty ||
        rcController.text.isEmpty ||
        nisController.text.isEmpty ||
        daysController.text.isEmpty ||
        maxController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول المطلوبة'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final String address = addressController.text;
    final String name = nameController.text;
    final int barcode = int.tryParse(barCodeController.text) ?? 0;
    final int phone = int.tryParse(phoneController.text) ?? 0;
    final int nif = int.tryParse(nifController.text) ?? 0;
    final int ai = int.tryParse(aiController.text) ?? 0;
    final int rc = int.tryParse(rcController.text) ?? 0;
    final int nis = int.tryParse(nisController.text) ?? 0;
    final int max = int.tryParse(maxController.text) ?? 0;
    final int days = int.tryParse(daysController.text) ?? 0;
    final int price = int.tryParse(priceController.text) ?? 0;
    final String category = categoryController.text.trim();

    final Clientt client = Clientt(
      name: name,
      Barcode: barcode,
      address: address,
      phoneNumber: phone,
      Price: price,
      NIF: nif,
      AI: ai,
      RC: rc,
      NIS: nis,
      MAX: max,
      DAYS: days,
      categorie: category,
    );

    Provider.of<ClientProvider>(context, listen: false).addClient(client);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت اضافة العميل بنجاح')),
    );

    // Clear fields after saving
    nameController.clear();
    barCodeController.clear();
    addressController.clear();
    phoneController.clear();
    priceController.clear();
    nifController.clear();
    aiController.clear();
    rcController.clear();
    nisController.clear();
    maxController.clear();
    daysController.clear();
    categoryController.clear();
  }
}
