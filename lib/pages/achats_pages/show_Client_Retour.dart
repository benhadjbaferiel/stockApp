import 'package:flutter/material.dart';

import 'vente_retour.dart';

class ShowClientRetour extends StatelessWidget {
  const ShowClientRetour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("   retour عرض client "),
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
                    builder: (context) => VenteRetour(),
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
