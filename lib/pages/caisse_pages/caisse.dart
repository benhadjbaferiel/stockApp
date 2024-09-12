import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/caisse_pages/add_caisse.dart';
import 'package:stock_dz_app/pages/caisse_pages/control_yr_money.dart';
import 'package:stock_dz_app/widgets.dart/in_Kwell_Custom.dart';

class Caisse extends StatefulWidget {
  const Caisse({super.key});

  @override
  State<Caisse> createState() => _CaisseState();
}

class _CaisseState extends State<Caisse> {
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
                            "     الصندوق",
                            style: TextStyle(fontSize: 40),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset('icons/14.png',
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
                            "                                                             اضافة او خصم ",
                        Icon: Icons.add,
                        callbackHandle: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => add_caisse()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkwellF(
                        label:
                            "                                                              حاسب نفسك  ",
                        Icon: Icons.money,
                        callbackHandle: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Control()),
                          );
                        },
                      )
                    ]))));
  }
}
