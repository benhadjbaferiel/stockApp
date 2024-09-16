import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/fournisseure_pages/add_fournisseur.dart';
import 'package:stock_dz_app/pages/fournisseure_pages/credit_fournisseure.dart';
import 'package:stock_dz_app/pages/other_pages/search.dart';
import 'package:stock_dz_app/pages/fournisseure_pages/show_fournisseure.dart';
import 'package:stock_dz_app/widgets.dart/in_Kwell_Custom.dart';

class FournisseurScreen extends StatefulWidget {
  const FournisseurScreen({super.key});

  @override
  State<FournisseurScreen> createState() => _FournisseurScreenState();
}

class _FournisseurScreenState extends State<FournisseurScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              Row(
                children: [
                  const Text(
                    "     الموردين",
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(width: 50),
                  Image.asset('images/101.png',
                      width: 110, height: 110, alignment: Alignment.topLeft),
                ],
              ),
              const SizedBox(height: 50),
              InkwellF(
                label:
                    "                                                           اضافة مورد جديد",
                Icon: Icons.add,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFournisseure()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                              ديون  للموردين",
                Icon: Icons.money,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditFournisseure()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                               عرض الموردين",
                Icon: Icons.search,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowFournisseure()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                         كشف حساب مورد بالتفصيل",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  _showSearchDialog(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                   تقرير بالفواتير لمورد ",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  _showSearchDialog(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                        تقرير بالفواتير لمورد اجمالي ",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  _showSearchDialog(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                       تقرير بالفواتير المرتجع لمورد ",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  _showSearchDialog(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                          تقرير بسندات القبض لمورد ",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  _showSearchDialog(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label: "    تقرير بحركة السداد للموردين على حسب طريقة الدفع  ",
                Icon: Icons.insert_chart,
                callbackHandle: () {
                  showDialog(
                    context: context, // You need to pass the context here
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "     حسب طريقة الدفع",
                          style: TextStyle(fontSize: 25),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Prevents dialog from taking full height
                          children: [
                            InkWell(
                              child: Text(
                                  "                                         نقدا"),
                              onTap: () {
                                // Add your action for نقدا (cash) here
                                Navigator.of(context)
                                    .pop(); // Close dialog after tapping
                              },
                            ),
                            SizedBox(
                                height:
                                    10), // Adds some spacing between options
                            InkWell(
                              child: Text(
                                  "                                         بطاقة"),
                              onTap: () {
                                // Add your action for بطاقة (card) here
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              child: Text(
                                  "                                         شيك"),
                              onTap: () {
                                // Add your action for شيك (check) here
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SearchDialog();
      },
    );
  }
}
