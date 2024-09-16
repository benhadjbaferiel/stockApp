import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/other_pages/search.dart';
import 'add_client.dart';
import 'credit_client.dart';
import 'show_client.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

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
                          "     العملاء",
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset('images/100.png',
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
                          "                                                       اضافة عميل جديد",
                      Icon: Icons.add,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddClient()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                               ديون العملاء",
                      Icon: Icons.money,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreditClient()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                                عرض العملاء",
                      Icon: Icons.search,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowClient()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                        كشف حساب عميل بالتفصيل ",
                      Icon: Icons.insert_chart,
                      callbackHandle: () {
                        _showSearchDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                    تقرير بالفواتير لعميل",
                      Icon: Icons.insert_chart,
                      callbackHandle: () {
                        _showSearchDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                        تقرير بالفواتير لعميل اجمالي ",
                      Icon: Icons.insert_chart,
                      callbackHandle: () {
                        _showSearchDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                       تقرير بالفواتير المرتجع لعميل ",
                      Icon: Icons.insert_chart,
                      callbackHandle: () {
                        _showSearchDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                         تقرير بسندات القبض لعميل ",
                      Icon: Icons.money,
                      callbackHandle: () {
                        _showSearchDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "      تقرير بحركة السداد للعملاء على حسب طريقة الدفع ",
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
                ))));
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
