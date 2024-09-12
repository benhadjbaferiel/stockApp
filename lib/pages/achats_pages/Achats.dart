import 'package:flutter/material.dart';
import '/widgets.dart/Interface_Ventes_Achat.dart';
import '../home_menu_pages/home2.dart';

class Achats extends StatefulWidget {
  const Achats({super.key});
  @override
  State<Achats> createState() => AchatsState();
}

class AchatsState extends State<Achats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Allows content to scroll if it overflows
        child: Container(
          height: 400,
          width: 360,
          child: InterfaceVenteAchat(
            title: 'المشتريات',
            menuItems: {
              "عرض فواتير المشتريات": () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
              "استيراد فاتورة مشتريات": () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
            },
          ),
        ),
      ),
    );
  }
}
