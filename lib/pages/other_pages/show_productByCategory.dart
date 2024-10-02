import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/Product_Provider.dart';
import 'package:stock_dz_app/providers/category_provider.dart';

class ShowProductbycategory extends StatefulWidget {
  const ShowProductbycategory({super.key});

  @override
  State<ShowProductbycategory> createState() => _ShowProductbycategoryState();
}

class _ShowProductbycategoryState extends State<ShowProductbycategory> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Products by Category')),
      body: SingleChildScrollView(
        child: Column(
          children: categoryProvider.categories.map((category) {
            return GestureDetector(
              onTap: () {
                // Show products for the selected category
                final products = productProvider.getProductsByCategory(
                    category.name); // Adjust based on your Category model
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(category
                        .name), // Adjust according to your Category model
                    content: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(products[index]
                              .name), // Adjust based on your Product model
                        );
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                color: const Color.fromARGB(255, 172, 161, 6),
                child: Text(
                  category.name, // Adjust based on your Category model
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
