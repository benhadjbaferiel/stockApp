class FournisseureCategory {
  int? id;
  String categoryName;

  FournisseureCategory({this.id, required this.categoryName});

  // Convert to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'idF': id, // Match the database column name
      'categoryNameSuppliers': categoryName, // Match the database column name
    };
  }

  // Convert from Map
  factory FournisseureCategory.fromMap(Map<String, dynamic> map) {
    return FournisseureCategory(
      id: map['idF'], // Match the database column name
      categoryName: map['categoryNameSuppliers'],
    );
  }
}
