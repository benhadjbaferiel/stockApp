import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/achats_pages/show_Facture%20_Achats.dart';
import 'package:stock_dz_app/pages/inventaire_pages/Add_Products.dart';
import 'package:stock_dz_app/providers/Product_Provider.dart';
import 'package:stock_dz_app/providers/category_provider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';
import '/widgets.dart/Interface_Ventes_Achat.dart';
import '../home_menu_pages/home2.dart';

class Achats extends StatefulWidget {
  const Achats({super.key});
  @override
  State<Achats> createState() => AchatsState();
}

class AchatsState extends State<Achats> {
  TextEditingController pieceController = TextEditingController();
  TextEditingController cartonController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  double total = 0.0;
  double sum = 0.0;

  // List to store selected products
  List<Map<String, dynamic>> selectedProducts = [];
  TextEditingController prixController = TextEditingController();
  TextEditingController prix1Controller = TextEditingController();
  TextEditingController prix2Controller = TextEditingController();
  TextEditingController prix3Controller = TextEditingController();
  TextEditingController prix4Controller = TextEditingController();
  void updateTotal() {
    total = selectedProducts.fold(
      0.0,
      (sum, item) {
        // Fetch values
        double prixAchat = double.tryParse(prixController.text) ?? 0;
        int cartonNumber = (item['cartonNumber'] as int? ?? 0);
        int cartonQty = int.tryParse(cartonController.text) ?? 0;
        int pieces = int.tryParse(pieceController.text) ?? 0;

        // Log the values for debugging
        print('Item: $item');
        print('Prix Achat: $prixAchat');
        print('Carton Number: $cartonNumber');
        print('Carton Qty: $cartonQty');
        print('Pieces: $pieces');

        // Calculate the current price
        double currentPrice = prixAchat * (cartonNumber * cartonQty + pieces);
        print('Current Price: $currentPrice');

        // Return the updated sum
        return sum + currentPrice;
      },
    );

    // Log the total
    print('Total: $total');

    setState(() {}); // Trigger a UI update
  }

  // Function to add a product to the selectedProducts list
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      selectedProducts.add(product);
      updateTotal();
    });
  }

  void removeProduct(int index) {
    selectedProducts.removeAt(index);
    updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Allows content to scroll if it overflows
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: InterfaceVenteAchat(
                title: 'المشتريات',
                menuItems: {
                  "اضف منتج": () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProduct()),
                    );
                  },
                  "عرض فواتير المشتريات": () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowFactureAchats()),
                    );
                  },
                  "استيراد فاتورة مشتريات": () {
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
                    cartonController.clear;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Center(child: Text('${product['name']}')),
                            content: Container(
                              height: 400,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            color: const Color.fromARGB(
                                                255, 253, 220, 220),
                                          ),
                                          child: Text(
                                              "${pieceController.text} + ${cartonController.text}(${product['cartonNumber']})")),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                      const Text(
                                        "الاجمالي",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 245, 226, 226),
                                        ),
                                        child: TextField(
                                            controller: pieceController,
                                            decoration: const InputDecoration(
                                                hintText: '  الحبة'),
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            onChanged: (value) => setState(() {
                                                  updateTotal();
                                                })),
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      const Text(
                                        "الحبة",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            color: const Color.fromARGB(
                                                255, 245, 226, 226),
                                          ),
                                          child: TextField(
                                              decoration: const InputDecoration(
                                                  hintText: 'الكرطونة'),
                                              controller: cartonController,
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                              onChanged: (value) =>
                                                  setState(() {
                                                    updateTotal();
                                                  }))),
                                      const SizedBox(
                                        width: 62,
                                      ),
                                      const Text(
                                        "الكرطونة",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),

                                  // here
                                  SizedBox(
                                    height: 6,
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            color: const Color.fromARGB(
                                                255, 253, 220, 220),
                                          ),
                                          child: // here i have to show (piece+(cartonNumber*carton))

                                              Text(
                                            '${((int.tryParse(pieceController.text) ?? 0) + (product['cartonNumber'] * (int.tryParse(cartonController.text) ?? 0))) * (double.tryParse(prixController.text) ?? 0)} ',
                                          )),
                                      const SizedBox(
                                        width: 23,
                                      ),
                                      const Text(
                                        "السعر الاجمالى",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            color: const Color.fromARGB(
                                                255, 245, 226, 226),
                                          ),
                                          child: TextField(
                                              controller: prixController,
                                              decoration: const InputDecoration(
                                                  hintText: 'سعر الشراء'),
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                              onChanged: (value) =>
                                                  setState(() {
                                                    updateTotal();
                                                  }))),
                                      const SizedBox(
                                        width: 47,
                                      ),
                                      Text(
                                        "سعر الشراء",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 253, 220, 220),
                                        ),
                                        child: Text(
                                          // look  here
                                          '${product['quantity']}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      const Text(
                                        "الكمية",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200]),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 48, child: CustomDate()),
                                        const Text(
                                          "تاريخ الانتهاء",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 245, 226, 226),
                                        ),
                                        child: TextField(
                                          controller: prix1Controller,
                                          decoration: InputDecoration(
                                            hintText: '${product['prix1']}',
                                          ),
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
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 245, 226, 226),
                                        ),
                                        child: TextField(
                                          controller: prix2Controller,
                                          decoration: InputDecoration(
                                            hintText: '${product['prix2']}',
                                          ),
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
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 245, 226, 226),
                                        ),
                                        child: TextField(
                                          controller: prix3Controller,
                                          decoration: InputDecoration(
                                            hintText: '${product['prix3']}',
                                          ),
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
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          color: const Color.fromARGB(
                                              255, 245, 226, 226),
                                        ),
                                        child: TextField(
                                          controller: prix4Controller,
                                          decoration: InputDecoration(
                                            hintText: '${product['prix4']}',
                                          ),
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
                                  Navigator.of(context).pop();
                                  removeProduct(index);
                                  updateTotal();

                                  // here i have to add code
                                },
                                child: Text('الغاء'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  updateTotal();
                                },
                                child: Text('حفظ'),
                              ),
                            ],
                          );
                        });
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
                              '${((int.tryParse(pieceController.text) ?? 0) + (product['cartonNumber'] * (int.tryParse(cartonController.text) ?? 0))) * (double.tryParse(prixController.text) ?? 0)}',
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
                                                    'prixAchat':
                                                        product.prixAchat,
                                                    'quantity':
                                                        product.quantity,
                                                    'cartonNumber':
                                                        product.carton,
                                                    'prix1': product.prix1,
                                                    'prix4': product.prix4,
                                                    'prix2': product.prix2,
                                                    'prix3': product.prix3,
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
                                                        BorderRadius.circular(
                                                            8),
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${product.prixAchat} DA',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.green),
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
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Total: \$${total}', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
