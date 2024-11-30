import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/home_menu_pages/home.dart';
import 'package:stock_dz_app/auth.dart';
import 'package:stock_dz_app/pages/home_menu_pages/home2.dart';

class widgetTree extends StatefulWidget {
  const widgetTree({super.key});

  @override
  State<widgetTree> createState() => _widgetTreeState();
}

class _widgetTreeState extends State<widgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return home();
        } else {
          return home2();
        }
      },
    );
  }
}
