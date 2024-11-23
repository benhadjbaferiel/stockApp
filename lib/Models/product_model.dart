import 'dart:io';

class Product {
  int? id;
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
  File? image; // Nullable field for an image
  final int? idP; // Nullable foreign key

  Product({
    this.id,
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
    this.idP,
  });

  // Factory constructor for creating a Product instance from a map
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // Nullable ID
      number: json['number']?.toInt() ?? 0, // Ensure integer
      name: json['name'] ?? '', // Fallback to empty string
      prix1: (json['prix1'] ?? 0.0).toDouble(), // Ensure double
      prix2: (json['prix2'] ?? 0.0).toDouble(),
      prix3: (json['prix3'] ?? 0.0).toDouble(),
      prix4: (json['prix4'] ?? 0.0).toDouble(),
      prixAchat: (json['prixAchat'] ?? 0.0).toDouble(),
      carton: json['carton']?.toInt() ?? 0, // Ensure integer
      quantity: json['quantity']?.toInt() ?? 0,
      category: json['category'] ?? '',
      notify: json['notify']?.toInt() ?? 0,
      description: json['description'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ??
          DateTime.now(), // Default to now if invalid
      image: json['image_path'] != null
          ? File(json['image_path'])
          : null, // Handle null image
      idP: json['idP'], // Nullable foreign key
    );
  }

  // Convert Product instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include ID if available
      'number': number,
      'name': name,
      'prix1': prix1,
      'prix2': prix2,
      'prix3': prix3,
      'prix4': prix4,
      'prixAchat': prixAchat,
      'carton': carton,
      'quantity': quantity,
      'category': category,
      'notify': notify,
      'description': description,
      'date': date.toIso8601String(), // ISO format for DateTime
      'image_path': image?.path, // Path of the image file
      'idP': idP, // Include foreign key if available
    };
  }
}
