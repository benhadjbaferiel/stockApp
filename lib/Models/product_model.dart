import 'dart:io';

class Product {
  int id;
  int number;
  String name;
  double prix1;
  double prix2;
  double prix3;
  double prix4;
  double prixAchat;
  int carton;
  int quantity;
  String category;
  int notify;
  String description;
  DateTime date;
  File? image;

  Product({
    required this.id,
    required this.number,
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
    this.image,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      number: json['number'],
      name: json['name'],
      prix1: json['prix1'],
      prix2: json['prix2'],
      prix3: json['prix3'],
      prix4: json['prix4'],
      prixAchat: json['prixachat'],
      carton: json['carton'],
      quantity: json['quantity'],
      category: json['category'],
      notify: json['notify'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      image: json['image_path'] != null ? File(json['image_path']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'prix1': prix1,
      'prix2': prix2,
      'prix3': prix3,
      'prix4': prix4,
      'prixachat': prixAchat,
      'carton': carton,
      'quantity': quantity,
      'category': category,
      'notify': notify,
      'description': description,
      'date': date.toIso8601String(),
      'image_path': image?.path,
    };
  }
}
