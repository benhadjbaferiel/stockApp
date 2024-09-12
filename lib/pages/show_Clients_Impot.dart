import 'package:flutter/material.dart';
import '/pages/page_Vente_Impot.dart';

class ShowClientImpot extends StatelessWidget {
  const ShowClientImpot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" impot عرض العملاء"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageVenteImpot(),
                  ),
                );
              },
              child: const Text("hhhhh"),
            ),
          ],
        ),
      ),
    );
  }
}
