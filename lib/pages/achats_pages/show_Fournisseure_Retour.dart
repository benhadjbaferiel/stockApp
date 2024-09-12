import 'package:flutter/material.dart';
import '/pages/achats_pages/Achat_Retour.dart';

class ShowFournisseureRetour extends StatelessWidget {
  const ShowFournisseureRetour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("   retour عرض الموردين"),
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
                    builder: (context) => AchatRetour(),
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
