import 'package:flutter/material.dart';

class trackPack extends StatefulWidget {
  const trackPack({super.key});

  @override
  State<trackPack> createState() => _trackPackState();
}

class _trackPackState extends State<trackPack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حركة  الباقات"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
    );
  }
}
