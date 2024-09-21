import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/home_menu_pages/home2.dart';
import 'package:stock_dz_app/providers/Product_Provider.dart';
import 'package:stock_dz_app/providers/category_provider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';
import 'package:stock_dz_app/widgets.dart/Interface_Ventes_Achat.dart';
import '../inventaire_pages/Add_Products.dart';

class Ventes extends StatefulWidget {
  const Ventes({super.key});

  @override
  State<Ventes> createState() => _VentesState();
}

class _VentesState extends State<Ventes> {
  List<Map<String, dynamic>> selectedProducts = [];
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      selectedProducts.add(product);
    });
  }

  TextEditingController cartonController = TextEditingController();
  TextEditingController pieceController = TextEditingController();
  TextEditingController prix1Controller = TextEditingController();
  TextEditingController prix2Controller = TextEditingController();
  TextEditingController prix3Controller = TextEditingController();
  TextEditingController prix4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            // Allows content to scroll if it overflows
            child: Column(children: [
      Container(
        height: 220,
        width: double.infinity,
        child: InterfaceVenteAchat(
          title: 'المبيعات',
          menuItems: {
            "اضف منتج": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()),
              );
            },
            "عرض فواتير المبيعات": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
            "تثبيت سعر البيع 1": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
            "تثبيت سعر البيع 2": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
            "تثبيت سعر البيع 3": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
            "تثبيت سعر البيع 4": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
            "استيراد فاتورة مبيعات": () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home2()),
              );
            },
          },
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: selectedProducts.length,
        itemBuilder: (context, index) {
          final product = selectedProducts[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text('${product['name']}')),
                    content: Container(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 93,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 253, 220, 220),
                                ),
                                child: Text("الكمية الاجمالية"),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                  height: 30,
                                  width: 56,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: const Color.fromARGB(
                                        255, 245, 226, 226),
                                  ),
                                  child: TextField(
                                    controller: pieceController,
                                    decoration:
                                        InputDecoration(hintText: '  الحبة'),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: const Color.fromARGB(
                                        255, 245, 226, 226),
                                  ),
                                  child: TextField(
                                    decoration:
                                        InputDecoration(hintText: '  الكرطونة'),
                                    controller: cartonController,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 253, 220, 220),
                                ),
                                child: Text("الاجمالي"),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: const Color.fromARGB(
                                        255, 245, 226, 226),
                                  ),
                                  child: TextField(
                                    controller: pieceController,
                                    decoration:
                                        InputDecoration(hintText: 'سعر الشراء'),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                  )),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                  height: 30,
                                  width: 93,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: const Color.fromARGB(
                                        255, 253, 220, 220),
                                  ),
                                  child: Text("الكمية الموجودة")),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 48,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(height: 48, child: CustomDate()),
                                Text(
                                  "تاريخ الانتهاء",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 245, 226, 226),
                                ),
                                child: TextField(
                                  controller: prix1Controller,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                child: Text(
                                  " سعر البيع1",
                                  style: TextStyle(fontSize: 21),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 245, 226, 226),
                                ),
                                child: TextField(
                                  controller: prix2Controller,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                child: Text(
                                  " سعر البيع2 ",
                                  style: TextStyle(fontSize: 21),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 245, 226, 226),
                                ),
                                child: TextField(
                                  controller: prix3Controller,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                child: Text(
                                  " سعر البيع3",
                                  style: TextStyle(fontSize: 21),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 245, 226, 226),
                                ),
                                child: TextField(
                                  controller: prix4Controller,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                child: Text(
                                  "سعر البيع4",
                                  style: TextStyle(fontSize: 21),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('الغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('حفظ'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: const Color.fromARGB(255, 239, 233, 252),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ${product['prixAchat'] * product['quantity']} DA',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${product['quantity']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' ${product['prixAchat']} DA',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        product['name'],
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              final categories =
                  Provider.of<CategoryProvider>(context).categories;

              return Container(
                width: double.infinity,
                height: 400,
                padding: EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            final products =
                                Provider.of<ProductProvider>(context)
                                    .getProductsByCategory(category.name);

                            return Container(
                              width: double.infinity,
                              height: 400,
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: products.length,
                                      itemBuilder: (context, index) {
                                        final product = products[index];
                                        return GestureDetector(
                                          onTap: () {
                                            // Add product to selectedProducts list when tapped
                                            _addProduct({
                                              'name': product.name,
                                              'prixAchat': product.prixAchat,
                                              'quantity': 1,
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  product.name,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${product.prixAchat} DA',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.menu,
          size: 40,
        ),
      ),
    ])));
  }
}
