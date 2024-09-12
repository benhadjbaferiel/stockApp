import 'package:flutter/material.dart';
import 'inventaire_pages/show_Product.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import 'inventaire_pages/Add_Products.dart';

class Inventaire extends StatefulWidget {
  const Inventaire({super.key});

  @override
  State<Inventaire> createState() => _InventaireState();
}

class _InventaireState extends State<Inventaire> {
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
                          "      المخزون",
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset('images/102.png',
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
                          "                                                           اضافة منتج جديد",
                      Icon: Icons.add,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProduct()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                               عرض المنتجات",
                      Icon: Icons.search,
                      callbackHandle: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowProduct()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                      اضافة تصنيف جديد",
                      Icon: Icons.add,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                  تعديل اسعار المنتجات",
                      Icon: Icons.change_circle,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                          استيراد بيانات المنتجات من ملف اكسل",
                      Icon: Icons.add,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                               سلة المنتجات المحدوفة",
                      Icon: Icons.delete,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                            اضافة باقة (جمع منتجات في منتج)",
                      Icon: Icons.add_card_outlined,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                             عرض الباقات",
                      Icon: Icons.menu_open_sharp,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkwellF(
                      label:
                          "                                                          حركة  الباقات  ",
                      Icon: Icons.analytics,
                      callbackHandle: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ))));
  }
}
