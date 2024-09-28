import 'package:flutter/material.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import 'user.dart';

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
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          " المستخدمين",
                          style: TextStyle(fontSize: 29),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Image.asset('icons/000.png',
                            width: 110,
                            height: 110,
                            alignment: Alignment.topLeft),
                      ],
                    ),
                    const SizedBox(
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
