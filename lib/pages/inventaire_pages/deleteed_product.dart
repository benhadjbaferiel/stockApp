import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/Product_Provider.dart';

class deletedProduct extends StatefulWidget {
  const deletedProduct({super.key});

  @override
  State<deletedProduct> createState() => _deletedProductState();
}

class _deletedProductState extends State<deletedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("سلة المنتجات المحذوفة"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return ListView.separated(
            itemCount: productProvider.deletedProducts.length,
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.grey),
            itemBuilder: (context, index) {
              final product = productProvider.deletedProducts[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(
                    'السعر: ${product.prix1}, الكمية: ${product.quantity}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.restore),
                      onPressed: () {
                        productProvider.restoreProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم استعادة المنتج')),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {
                        productProvider.permanentlyDeleteProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('تم حذف المنتج نهائيًا')),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
