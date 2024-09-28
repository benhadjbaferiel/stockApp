import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/achatssRetour/showFacture_retour_achat.dart';
import 'package:stock_dz_app/pages/inventaire_pages/Add_Products.dart';
import 'package:stock_dz_app/providers/Product_Provider.dart';
import 'package:stock_dz_app/providers/category_provider.dart';
import 'package:stock_dz_app/providers/invoiceModelProvider.dart';
import 'package:stock_dz_app/providers/total_provider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';
import 'package:uuid/uuid.dart';
import '../home_menu_pages/home2.dart';
import '/widgets.dart/Interface_Ventes_Achat.dart';

class AchatRetour extends StatefulWidget {
  AchatRetour({super.key});

  @override
  State<AchatRetour> createState() => _AchatRetourState();
}

class _AchatRetourState extends State<AchatRetour> {
  void _showDialog(Invoice? invoice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                height: 420,
                width: double.infinity,
                child: Column(
                  children: [
                    // Payment Method Selection
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StatefulBuilder(
                            builder: (context, setInnerState) {
                              return Row(
                                children: [
                                  Radio<String>(
                                    value: "طلب شراء",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("طلب شراء"),
                                  Radio<String>(
                                    value: "نقدا",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("نقدا"),
                                  SizedBox(width: 20),
                                  Radio<String>(
                                    value: "اجل",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("اجل"),
                                  SizedBox(width: 20),
                                  Radio<String>(
                                    value: "بطاقة",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("بطاقة"),
                                  SizedBox(width: 20),
                                  Radio<String>(
                                    value: "اذن استلام مخزني",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("اذن استلام مخزني"),
                                  SizedBox(width: 20),
                                  Radio<String>(
                                    value: "شيك",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setInnerState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                  Text("شيك"),
                                  SizedBox(width: 15),
                                  Text(
                                    "طريقة الدفع",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Total
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              Provider.of<TotalProvider>(context)
                                  .total
                                  .toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "الاجمالي",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Amount Paid
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: TextField(
                            controller: versementController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {}); // Refresh remaining amount
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "المدفوع",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Remaining Amount
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              remaining.toStringAsFixed(2),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "الباقي",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Tax and Discount
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: TextField(
                            controller: TaxController,
                          ),
                        ),
                        Text("الضريبة"),
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: TextField(
                            controller: reductionControllerprcnt,
                            decoration: InputDecoration(hintText: '%'),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: TextField(
                            controller: reductionController,
                          ),
                        ),
                        Text("الخصم"),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Supplier Name
                    Text(
                      "حفظ الفاتورة لحساب مورد",
                      style: TextStyle(fontSize: 21),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 248),
                        border: Border.all(width: 1),
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'ابحث عن مورد او ادخل اسم'),
                      ),
                    ),
                    SizedBox(height: 6),
                    // Remarks
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 248),
                        border: Border.all(width: 1),
                      ),
                      child: TextField(
                        controller: remarqueController,
                        decoration: InputDecoration(
                            hintText: 'اكتب ملاحظة في الفاتورة'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveInvoice();
                },
                child: Text("حفظ"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveCanceledInvoice();
                },
                child: Text("الغاء"),
              ),
            ],
          );
        });
      },
    );
  }

  String groupValue = "طلب شراء";
  double total = 0.0;
  double sum = 0.0;
  void updateTotal() {
    final totalProvider = Provider.of<TotalProvider>(context, listen: false);

    totalProvider.updateTotal(
        selectedProducts, prixController, cartonController, pieceController);
  }

  void removeProduct(int index) {
    selectedProducts.removeAt(index);
    updateTotal();
  }

  List<Map<String, dynamic>> selectedProducts = [];
  TextEditingController cartonController = TextEditingController();
  TextEditingController pieceController = TextEditingController();
  TextEditingController prixController = TextEditingController();

  TextEditingController prix1Controller = TextEditingController();
  TextEditingController prix2Controller = TextEditingController();
  TextEditingController prix3Controller = TextEditingController();
  TextEditingController prix4Controller = TextEditingController();

  // Function to add a product to the selectedProducts list
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      selectedProducts.add(product);
    });
  }

  TextEditingController versementController = TextEditingController();
  TextEditingController reductionController = TextEditingController();
  TextEditingController reductionControllerprcnt = TextEditingController();
  TextEditingController TaxController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController remarqueController = TextEditingController();
  double get remaining {
    final total = Provider.of<TotalProvider>(context, listen: false).total;
    final paid = double.tryParse(versementController.text) ?? 0;
    final discount = double.tryParse(reductionController.text) ?? 0;
    final tax = double.tryParse(TaxController.text) ?? 0;
    final discountPercentage =
        double.tryParse(reductionControllerprcnt.text) ?? 0;
    final discountAmount = (total * discountPercentage) / 100;

    return total - paid - discount - discountAmount - tax;
  }

  void _saveInvoice() {
    final invoiceProvider =
        Provider.of<InvoiceProvider>(context, listen: false);
    final totalProvider = Provider.of<TotalProvider>(context, listen: false);

    final newInvoice = Invoice(
      id: Uuid().v4(),
      supplierName: nameController.text.isNotEmpty
          ? nameController.text
          : 'Unnamed', // Get supplier name
      total: totalProvider.total,
      paid: double.tryParse(versementController.text) ?? 0,
      paymentMethod: groupValue,
      tax: double.tryParse(TaxController.text) ?? 0,
      discount: double.tryParse(reductionController.text) ?? 0,
      note: remarqueController.text,
      date: DateTime.now(),
    );

    invoiceProvider.addInvoiceAR(newInvoice);

    // Clear the form fields
    versementController.clear();
    reductionController.clear();
    reductionControllerprcnt.clear();
    TaxController.clear();
    nameController.clear();
    remarqueController.clear();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invoice saved successfully')),
    );
    print(
        "Saving invoice: ${newInvoice.supplierName}, Total: ${newInvoice.total}");
  }

  void _saveCanceledInvoice() {
    final invoiceProvider =
        Provider.of<InvoiceProvider>(context, listen: false);
    final totalProvider = Provider.of<TotalProvider>(context, listen: false);

    final canceledInvoice = Invoice(
      id: Uuid().v4(),
      supplierName: 'reda',
      total: totalProvider.total,
      paid: double.tryParse(versementController.text) ?? 0,
      paymentMethod: groupValue,
      tax: double.tryParse(TaxController.text) ?? 0,
      discount: double.tryParse(reductionController.text) ?? 0,
      note: remarqueController.text,
      date: DateTime.now(),
      isCanceled: true, // Marquer la facture comme annulée
    );

    invoiceProvider.addInvoiceCancledAR(canceledInvoice);

    // Clear the form fields
    versementController.clear();
    reductionController.clear();
    reductionControllerprcnt.clear();
    TaxController.clear();
    nameController.clear();
    remarqueController.clear();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Canceled invoice saved successfully')),
    );
    print(
        "Saving canceled invoice: ${canceledInvoice.supplierName}, Total: ${canceledInvoice.total}");
  }

  @override
  Widget build(BuildContext context) {
    final totalProvider = Provider.of<TotalProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: InterfaceVenteAchat(
                showdialogue: () {
                  _showDialog(null);
                },
                title: 'شاشة المرتجعات ',
                menuItems: {
                  "اضافة منتج": () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
                  "عرض فواتير المرتجعات": () {
                    // Logique pour afficher les factures
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowfactureRetourAchat(
                                  label: 'عرض فواتير المرتجعات',
                                )),
                      );
                    };
                  },
                  "استيراد فاتورة المرتجعات": () {
                    // Logique pour importer une facture
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home2()));
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
                        return StatefulBuilder(builder: (context, setState) {
                          return SingleChildScrollView(
                            child: AlertDialog(
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
                                              onChanged: (value) =>
                                                  setState(() {
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
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'الكرطونة'),
                                                controller: cartonController,
                                                keyboardType:
                                                    const TextInputType
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
                                                  'Total: ${totalProvider.total}'),
                                        ),
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
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'سعر الشراء'),
                                                keyboardType:
                                                    const TextInputType
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                            ),
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
                                                    'prixAchat':
                                                        product.prixAchat,
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
                  Text('${totalProvider.total}',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
