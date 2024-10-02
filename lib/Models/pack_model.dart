import 'package:stock_dz_app/Models/product_model.dart';

class Pack {
  final String name;
  final List<Product> products;
  final String quantity;
  final String price;

  Pack(
      {required this.name,
      required this.products,
      required this.quantity,
      required this.price});
}
