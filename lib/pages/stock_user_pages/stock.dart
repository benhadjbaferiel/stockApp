import 'package:flutter/material.dart';
import 'add_Stock.dart';
import 'show_Stock.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

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
                          "    المخازن",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Image.asset('icons/000.png',
                            width: 110,
                            height: 110,
                            alignment: Alignment.topLeft),
                      ],
                    ),
                    // SizedBox(height: 50,),
                    InkwellF(
                      label:
                          "                                                             شحن مخزون ",
                      Icon: Icons.production_quantity_limits_sharp,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Add_Stock()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                  عرض شحنات المخزون",
                      Icon: Icons.menu,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Show_Stock()),
                        );
                      },
                    ),
                  ],
                ))));
  }
}
