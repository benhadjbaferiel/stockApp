import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Models/product_model.dart';
import '../../providers/Product_Provider.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  void initState() {
    super.initState();
    // Load the suppliers only once
    Provider.of<ProductProvider>(context, listen: false).loadproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المنتجات المتوفرة في المخزن"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
                borderSide: const BorderSide(width: 0.4),
              ),
              hintText: "ابحث عن منتج او استخدم الكاميرا",
              prefixIcon: IconButton(
                icon: const Icon(Icons.qr_code, size: 30),
                onPressed: () {
                  // Implement QR code scanning if needed
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Container(
                color: Colors.grey[200],
                height: 35,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "المزيد" button
                  },
                  child: const Text("المزيد"),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                color: Colors.grey[200],
                height: 35,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "صناعة الباركود" button
                  },
                  child: const Text("صناعة الباركود"),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                color: Colors.grey[200],
                height: 35,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "تقرير" button
                  },
                  child: const Text("تقرير"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 35,
            width: 400,
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'الكمية',
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'السعر',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'المنتج',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'رقم المنتج',
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                return ListView.separated(
                  itemCount: productProvider.products.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return ListTile(
                      onTap: () => _showProductDetails(context, product),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${product.quantity}",
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${product.prix1}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              product.name,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${product.id ?? '-'}",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Name
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Product Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: product.image != null
                    ? Image.file(
                        product.image!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              // Price and Quantity Inputs
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('تعديل السعر'),
                        TextFormField(
                          initialValue: product.prix1.toString(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('اضافة كميه للمخزون'),
                        TextFormField(
                          initialValue: product.quantity.toString(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Action Buttons (Delete, Freeze, Edit)
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        ' إلغاء المنتج من المخزون',
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .deleteProduct(product);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم حذف المنتج')),
                            );
                          },
                          icon: const Icon(Icons.cancel, color: Colors.red))
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 60),
                      const Text(
                        'تجميد هذا المنتج',
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add freeze functionality
                        },
                        icon: const Icon(Icons.pause_circle_filled,
                            color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      const Text(
                        'تعديل بيانات المنتج',
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add edit functionality
                        },
                        icon: const Icon(Icons.edit, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Dialog Buttons (Follow, Cancel)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Continue
                    },
                    child: const Text("متابعة"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cancel
                    },
                    child: const Text(
                      "تراجع",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
