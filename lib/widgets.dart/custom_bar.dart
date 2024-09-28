import 'package:flutter/material.dart';
import '/widgets.dart/Custom_Date.dart';

class Custombar extends StatefulWidget {
  final VoidCallback showdialogue;
  Custombar({required this.showdialogue, Key? key}) : super(key: key);

  @override
  State<Custombar> createState() => _CustombarState();
}

class _CustombarState extends State<Custombar> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        width: 370,
        color: const Color.fromARGB(255, 246, 245, 245),
        child: Row(
          children: [
            CustomDate(),
            const SizedBox(width: 45),
            const Text(
              "تاريخ الفاتورة",
              style: TextStyle(fontSize: 23, color: Colors.grey),
            ),
          ],
        ),
      ),
      TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(width: 0.8),
          ),
          hintText: "ابحث عن منتج او استخدم الكاميرا",
          prefixIcon: IconButton(
            icon: Icon(Icons.save, size: 30),
            onPressed: widget.showdialogue, // Pass null for a new invoice
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.qr_code, size: 30),
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}
