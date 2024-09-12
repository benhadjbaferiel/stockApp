import 'package:flutter/material.dart';
import '../inventaire_pages/Add_Products.dart';
import '/widgets.dart/custom_bar.dart';

class Ventes extends StatefulWidget {
  const Ventes({super.key});

  @override
  State<Ventes> createState() => _VentesState();
}

class _VentesState extends State<Ventes> {
  String item1 = "  اضافة منتج ";
  String item2 = "  عرض فواتير المبيعات";
  String item3 = "تثبيت سعر البيع 1";
  String item4 = "تثبيت سعر البيع 2";
  String item5 = "تثبيت سعر البيع 3";
  String item6 = "تثبيت سعر البيع 4";
  String item7 = " استيراد فاتورة مبيعات";
  void _showItem1Dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' إعادة طباعة الفاتورة'),
          content: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "                               ادخل رقم الفاتورة"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('تراجع'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('متابعة'),
              onPressed: () {
                // Handle the submission
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showItem2Dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' تعديل الفاتورة'),
          content: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "                               ادخل رقم الفاتورة"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('تراجع'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('متابعة'),
              onPressed: () {
                // Handle the submission
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'اضافة منتج':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddProduct()),
        );
        break;
      case 'عرض فواتير المبيعات':
        _showItem2Dialog(context);
        break;
      case 'تثبيت سعر البيع 1':
        _showItem2Dialog(context);
        break;
      case 'تثبيت سعر البيع 2':
        _showItem2Dialog(context);
        break;
      case 'تثبيت سعر البيع 3':
        _showItem2Dialog(context);
        break;
      case 'تثبيت سعر البيع 4':
        _showItem2Dialog(context);
        break;
      case 'استيراد فاتورة مبيعات':
        _showItem2Dialog(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (String value) => _handleMenuSelection(context, value),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(item1),
                value: item1,
              ),
              PopupMenuItem(
                child: Text(item2),
                value: item2,
              ),
              PopupMenuItem(
                child: Text(item3),
                value: item3,
              ),
              PopupMenuItem(
                child: Text(item4),
                value: item4,
              ),
              PopupMenuItem(
                child: Text(item5),
                value: item5,
              ),
              PopupMenuItem(
                child: Text(item6),
                value: item6,
              ),
              PopupMenuItem(
                child: Text(item7),
                value: item7,
              ),
            ],
          ),
        ],
        title: Text(
          "المبيعات",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(width: 45),
            Custombar(),
          ],
        ),
      ),
    );
  }
}
