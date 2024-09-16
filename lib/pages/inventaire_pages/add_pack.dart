import 'package:flutter/material.dart';

class addPack extends StatefulWidget {
  const addPack({super.key});

  @override
  State<addPack> createState() => _addPackState();
}

class _addPackState extends State<addPack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة باقة"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
    );
  }
}
