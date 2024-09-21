import 'package:stock_dz_app/Models/product_model.dart';

class CategoryProduct {
  final String name;
  final List<Product> products;

  CategoryProduct({
    required this.name,
    required this.products,
  });
}
