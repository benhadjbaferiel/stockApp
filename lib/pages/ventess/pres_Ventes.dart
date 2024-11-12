import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/ventess/cancledFcature_ventes.dart';
import 'package:stock_dz_app/pages/ventess/showFacture_Ventes.dart';
import '../client_pages/show_client.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class PresVentes extends StatefulWidget {
  PresVentes({super.key});

  @override
  State<PresVentes> createState() => _PresVentesState();
}

class _PresVentesState extends State<PresVentes> {
  void showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "           تقارير المبيعات ",
            style: TextStyle(fontSize: 25),
          ),
          content: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "  تقرير بالمبيعات لفترة",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "   تقرير بالمبيعات حسب الصنف",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات حسب التصنيف"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("  تقرير بالمبيعات  النقد"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات  الاجل"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات  (بطاقة)"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات (شيك)"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات (الكل)"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات حسب عميل"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("تقرير بالمبيعات اكسل"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(" تقرير بالمبيعات اكسل مع المنتجات"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Image.asset(
                'images/5.png',
                width: 250,
                height: 150,
              ),
              InkwellF(
                label:
                    "                                                              عرض العملاء  ",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowClient()),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                    عرض فواتير المبيعات  ",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => showFactureVente(
                              label: ' عرض فواتير المبيعات',
                            )),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                            تقرير  المبيعات  ",
                Icon: Icons.copy_sharp,
                callbackHandle: () {
                  showDialogue(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                الفواتير التي تم الغاءها  ",
                Icon: Icons.delete,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CancelFactureVente()),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
