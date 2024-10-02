import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/pack_provider.dart';

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
        title: const Text("عرض الباقات"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: Consumer<PackProvider>(builder: (context, packProvider, child) {
        return ListView.builder(
          itemCount: packProvider.packs.length,
          itemBuilder: (context, index) {
            final pack = packProvider.packs[index];
            return ListTile(
              title: Text(pack.name, textAlign: TextAlign.right),
              subtitle: Text(
                  'الكمية: ${pack.quantity}, السعر: ${pack.price} د.ج',
                  textAlign: TextAlign.right),
              onTap: () {
                // Optionally, navigate to a detailed view of the pack
              },
            );
          },
        );
      }),
    );
  }
}
