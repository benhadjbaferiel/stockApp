import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/Vente_Retour/factureRetourVentes.dart';
import 'package:stock_dz_app/pages/achatss/show_Facture%20_Achats.dart';
import 'package:stock_dz_app/pages/achatssRetour/showFacture_retour_achat.dart';
import 'package:stock_dz_app/pages/inventaire_pages/show_Product.dart';
import 'package:stock_dz_app/pages/other_pages/show_productByCategory.dart';
import 'package:stock_dz_app/pages/ventess/showFacture_Ventes.dart';
import '/widgets.dart/Custom_Date.dart'; // Corrected import path
import '/widgets.dart/BUILDLIST.dart'; // Corrected import path

class Requet extends StatelessWidget {
  Requet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
              Row(
                children: [
                  const Text(
                    "  الاستعلامات",
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(width: 50),
                  Image.asset(
                    'images/16.png',
                    width: 100,
                    height: 100,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle the button press
                    },
                    icon: Icon(Icons.save_alt),
                  ),
                  CustomDate(),
                  Text(" الى"),
                  CustomDate(),
                  Text("من"),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "                                        المتجر",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 196, 35, 23),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  BuildListItem(
                    title:
                        '                                     عرض حركة المتجر',
                    callbackHandle2: () => Navigator.pop(context),
                  ),
                  BuildListItem(
                    title:
                        '                                            تقارير الارباح',
                    callbackHandle2: () => Navigator.pop(context),
                  ),
                  Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "                            عرض الفواتير",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 196, 35, 23),
                        ),
                      ),
                    ),
                  ),
                  BuildListItem(
                    title: '                               عرض فواتير المبيعات',
                    callbackHandle2: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showFactureVente(
                                  label: "عرض فواتير المبيعات",
                                )),
                      );
                    },
                  ),
                  BuildListItem(
                      title: '                عرض فواتير المرتجعات من البيع',
                      callbackHandle2: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Factureretourventes()))),
                  BuildListItem(
                      title: '                            عرض فواتير المشتريات',
                      callbackHandle2: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowFactureAchats(
                                      label: 'عرض فواتير المشتريات',
                                    )),
                          )),
                  BuildListItem(
                    title: '             عرض فواتير المرتجعات من الشراء',
                    callbackHandle2: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowfactureRetourAchat(
                                  label: 'عرض فواتير المرتجعات من الشراء',
                                )),
                      );
                    },
                  ),
                  Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "                                        المخزون",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 196, 35, 23),
                        ),
                      ),
                    ),
                  ),
                  BuildListItem(
                      title:
                          '                                               جرد مخزني',
                      callbackHandle2: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowProduct()),
                          )),
                  BuildListItem(
                      title:
                          '                                            مخزون إيجابي',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title:
                          '                                             مخزون سلبي',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title: '                       جرد مخزني حسب التصنيف',
                      callbackHandle2: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowProductbycategory()),
                          )),
                  BuildListItem(
                      title: '         تقرير بالمنتجات حسب تاريخ الانتهاء ',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title:
                          '                                   تقرير بحركه منتج',
                      callbackHandle2: () => Navigator.pop(context)),
                  Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "                                     الصندوق",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 196, 35, 23),
                        ),
                      ),
                    ),
                  ),
                  BuildListItem(
                      title:
                          '                                   تقرير بحركة الصندوق ',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title:
                          '                                         تقرير راس المال ',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title:
                          '                                              حساب الزكاة',
                      callbackHandle2: () => Navigator.pop(context)),
                  Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "                              المصروفات",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 196, 35, 23),
                        ),
                      ),
                    ),
                  ),
                  BuildListItem(
                      title:
                          '                                        تقرير بالمصروفات ',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title: '                   قرير بالمصروفات حسب الحساب ',
                      callbackHandle2: () => Navigator.pop(context)),
                  BuildListItem(
                      title:
                          '                          تقرير بالمصروفات  للحساب ',
                      callbackHandle2: () => Navigator.pop(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
