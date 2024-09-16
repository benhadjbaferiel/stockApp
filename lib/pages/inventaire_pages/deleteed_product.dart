import 'package:flutter/material.dart';

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
    );
  }
}
