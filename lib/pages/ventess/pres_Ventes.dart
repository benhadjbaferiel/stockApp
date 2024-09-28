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
