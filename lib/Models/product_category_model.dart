class CategoryProduct {
  int? id;
  final String CategoryPname;

  CategoryProduct({
    this.id,
    required this.CategoryPname,
  });
  Map<String, dynamic> toMap() {
    return {
      'id8': id,
      'categoryPName': CategoryPname,
    };
  }

  factory CategoryProduct.fromMap(Map<String, dynamic> map) {
    return CategoryProduct(
      id: map['id8'],
      CategoryPname: map['categoryPName'],
    );
  }
  String Getcategoryname(String c) {
    return c = this.CategoryPname;
  }
}
