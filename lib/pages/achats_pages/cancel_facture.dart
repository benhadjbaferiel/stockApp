import 'package:flutter/material.dart';

class cancelFacture extends StatefulWidget {
  const cancelFacture({super.key});

  @override
  State<cancelFacture> createState() => _cancelFactureState();
}

class _cancelFactureState extends State<cancelFacture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الفواتير التي تم الغاءها"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
    );
  }
}
