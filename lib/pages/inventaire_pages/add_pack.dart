import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/pack_provider.dart';
import 'package:stock_dz_app/widgets.dart/multi_select_drop_down_buton.dart';
import '/Models/product_model.dart';
import '../../providers/Product_Provider.dart';
import '/Models/pack_model.dart';

class AddPack extends StatefulWidget {
  const AddPack({Key? key}) : super(key: key);

  @override
  State<AddPack> createState() => _AddPackState();
}

class _AddPackState extends State<AddPack> {
  TextEditingController nameController = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();

  List<Product> selectedProducts = [];
  Product? selectedProduct; // To store selected product from dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة باقة"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: nameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'ادخل اسم الباقة',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "اختر المنتجات المشكلة للباقة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return GestureDetector(
                    onTap: () =>
                        _openMultiSelectDialog(context, productProvider),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'اختر منتج',
                        labelStyle: TextStyle(fontSize: 16),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      child: Text(
                        selectedProducts.isEmpty
                            ? 'اختر المنتجات'
                            : selectedProducts
                                .map((product) => product.name)
                                .join(', '),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                "المنتجات المختارة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedProducts.length,
                itemBuilder: (context, index) {
                  final product = selectedProducts[index];
                  return ListTile(
                    title: Text(product.name, textAlign: TextAlign.right),
                    subtitle: Text('${product.prix1} د.ج',
                        textAlign: TextAlign.right),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        setState(() {
                          selectedProducts.remove(product);
                        });
                      },
                    ),
                  );
                },
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: price,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      hintText:
                          '                                                                 السعر'),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: qty,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      hintText:
                          '                                                                 الكمية'),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  child: Text("إضافة الباقة"),
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        selectedProducts.isNotEmpty &&
                        qty.text.isNotEmpty &&
                        price.text.isNotEmpty) {
                      // Create a new Pack
                      Pack newPack = Pack(
                        name: nameController.text,
                        products: selectedProducts,
                        quantity: qty.text,
                        price: price.text,
                      );

                      // Add the pack using PackProvider
                      Provider.of<PackProvider>(context, listen: false)
                          .addPack(newPack);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تمت اضافة الباقة بنجاح')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('الرجاء إدخال جميع الحقول المطلوبة')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openMultiSelectDialog(
      BuildContext context, ProductProvider productProvider) async {
    final List<Product> selectedItems = await showDialog<List<Product>>(
          context: context,
          builder: (context) {
            return MultiSelectDialog(
              items: productProvider.products,
              selectedItems: selectedProducts,
            );
          },
        ) ??
        [];

    if (selectedItems.isNotEmpty && selectedItems != selectedProducts) {
      setState(() {
        selectedProducts = selectedItems;
      });
    }
  }
}
