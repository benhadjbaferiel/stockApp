import 'dart:io';

class Product {
  final int number;
  final String name;
  final int prix1;
  final int prix2;
  final int prix3;
  final int prix4;
  final int prixAchat;
  final int carton;
  final int quantity;
  final String category;
  final int notify;
  final String description;
  final DateTime date;
  final File? image;
  Product(
      {required this.number,
      required this.name,
      required this.prix1,
      required this.prix2,
      required this.prix3,
      required this.prix4,
      required this.prixAchat,
      required this.carton,
      required this.quantity,
      required this.category,
      required this.notify,
      required this.description,
      required this.date,
      this.image});
}
