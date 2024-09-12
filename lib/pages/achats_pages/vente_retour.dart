import 'package:flutter/material.dart';
import '/widgets.dart/Interface_Ventes_Achat.dart';
import '../home_menu_pages/home2.dart';

class VenteRetour extends StatelessWidget {
  const VenteRetour({super.key});

  @override
  Widget build(BuildContext context) {
    return InterfaceVenteAchat(
      title: 'شاشة المرتجعات-المبيعات',
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
        "تثبيت سعر 1": () {
          // Logique pour importer une facture
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home2()));
        },
        " تثبيت سعر 2": () {
          // Logique pour importer une facture
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home2()));
        },
        "تثبيت سعر 3": () {
          // Logique pour importer une facture
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
