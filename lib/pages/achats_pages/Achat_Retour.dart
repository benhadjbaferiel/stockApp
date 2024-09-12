import 'package:flutter/material.dart';
import '../home_menu_pages/home2.dart';
import '/widgets.dart/Interface_Ventes_Achat.dart';

class AchatRetour extends StatelessWidget {
  AchatRetour({super.key});

  @override
  Widget build(BuildContext context) {
    return InterfaceVenteAchat(
      title: 'شاشة المرتجعات ',
      menuItems: {
        "اضافة منتج": () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home2()));
        },
        "عرض فواتير المرتجعات": () {
          // Logique pour afficher les factures
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home2()));
        },
        "استيراد فاتورة المرتجعات": () {
          // Logique pour importer une facture
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home2()));
        },
      },
    );
  }
}
