import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/achatss/cancel_facture.dart';
import 'package:stock_dz_app/pages/achatss/show_Facture%20_Achats.dart';
import '../fournisseure_pages/show_fournisseure.dart';
import '../home_menu_pages/home2.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class Presachat extends StatelessWidget {
  const Presachat({Key? key}) : super(key: key);

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
                    "                                                           عرض الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowFournisseure()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                  عرض فواتير الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowFactureAchats(
                              label: 'عرض فواتير الموردين',
                            )),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                          تقرير المشتريات",
                Icon: Icons.copy_sharp,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home2()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                الفواتير التي تم الغاءها",
                Icon: Icons.view_list_outlined,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CancelFacture()),
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
