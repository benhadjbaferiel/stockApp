import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/other_pages/canceledFactureImpot.dart';
import 'package:stock_dz_app/pages/other_pages/showFacture_Vente_impot.dart';
import '/pages/other_pages/show_Clients_Impot.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import '/pages/home_menu_pages/home2.dart';

class ImpotHomePage extends StatelessWidget {
  const ImpotHomePage({super.key});

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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Row(
                      children: [
                        const Text(
                          "     الفواتير الضريبية",
                          style: TextStyle(fontSize: 29),
                        ),
                        Image.asset('icons/145.png',
                            width: 110,
                            height: 110,
                            alignment: Alignment.topLeft),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkwellF(
                      label:
                          "                                                                عرض العملاء",
                      Icon: Icons.list_alt,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowClientImpot()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                    عرض فواتير الضريبية",
                      Icon: Icons.paste,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => showFacture_Impot()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                              تقرير الضريبية",
                      Icon: Icons.paste,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home2()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                   الفواتير التي تم الغاءها",
                      Icon: Icons.cancel,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Canceledfactureimpot()),
                        );
                      },
                    ),
                  ],
                ))));
  }
}
