import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_dz_app/firebase_options.dart';
import 'package:stock_dz_app/providers/category_provider.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';
import 'package:stock_dz_app/providers/invoiceModelProvider.dart';
import 'package:stock_dz_app/providers/pack_provider.dart';
import 'package:stock_dz_app/providers/total_provider.dart';
import 'package:stock_dz_app/providers/userProvider.dart';
import 'pages/home_menu_pages/first.dart';
import 'package:provider/provider.dart';
import 'providers/Product_Provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  // Ajout de logs pour vérifier l'initialisation
  print('Firebase initialisé');
  print('Firebase Auth instance: ${FirebaseAuth.instance.hashCode}');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
        ChangeNotifierProvider(create: (context) => FournisseureProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => InvoiceProvider()),
        ChangeNotifierProvider(create: (context) => PackProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(
          create: (context) => TotalProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
      ),
    );
  }
}
