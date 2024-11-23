import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/stock_user_pages/add_user.dart';
import 'package:stock_dz_app/pages/stock_user_pages/show_user.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class User extends StatelessWidget {
  const User({super.key});

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
                          "    المستخدمين",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          width: 20,
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
                          "                                                               اضافة مستخدم",
                      Icon: Icons.add,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddUser()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                          عرض المستخدمين",
                      Icon: Icons.menu,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowUsers()),
                        );
                      },
                    ),
                  ],
                ))));
  }
}
