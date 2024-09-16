import 'package:flutter/material.dart';

class show_pack extends StatefulWidget {
  const show_pack({super.key});

  @override
  State<show_pack> createState() => _show_packState();
}

class _show_packState extends State<show_pack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" عرض الباقات"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
    );
  }
}
