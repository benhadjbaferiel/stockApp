import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/Vente_Retour/factureRetourVentes.dart';
import 'show_Client_Retour.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class PresVenteRetour extends StatefulWidget {
  const PresVenteRetour({super.key});

  @override
  State<PresVenteRetour> createState() => _PresVenteRetourState();
}

class _PresVenteRetourState extends State<PresVenteRetour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Image.asset(
                'images/5.png',
                width: 250,
                height: 150,
              ),
              InkwellF(
                label:
                    "                                                                عرض العملاء ",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowClientRetour()),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                عرض فواتير المرتجعات",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Factureretourventes()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
