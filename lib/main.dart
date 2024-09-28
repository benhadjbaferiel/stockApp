import 'package:flutter/material.dart';
import 'package:stock_dz_app/providers/category_provider.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';
import 'package:stock_dz_app/providers/invoiceModelProvider.dart';
import 'package:stock_dz_app/providers/total_provider.dart';

import 'pages/home_menu_pages/first.dart';
import 'package:provider/provider.dart';
import 'providers/Product_Provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
        ChangeNotifierProvider(create: (context) => FournisseureProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => InvoiceProvider()),
        ChangeNotifierProvider(
          create: (context) => TotalProvider(),
        )
      ],
      child: MaterialApp(
        home: FirstPage(),
      ),
    );
  }
}
