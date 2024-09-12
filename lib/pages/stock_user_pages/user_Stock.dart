import 'package:flutter/material.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import 'user.dart';
import 'stock.dart';

class UserStock extends StatelessWidget {
  const UserStock({super.key});

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
                          "المخازن و المستخدمين",
                          style: TextStyle(fontSize: 29),
                        ),
                        Image.asset('icons/000.png',
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
                          "                                                                  المخازن",
                      Icon: Icons.production_quantity_limits_sharp,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Stock()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                             المستخدمين",
                      Icon: Icons.verified_user_sharp,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const User()),
                        );
                      },
                    ),
                  ],
                ))));
  }
}
