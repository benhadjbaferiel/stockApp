import 'dart:io';

class Product {
  final int number;
  final String name;
  final double prix1;
  final double prix2;
  final double prix3;
  final double prix4;
  final double prixAchat;
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
