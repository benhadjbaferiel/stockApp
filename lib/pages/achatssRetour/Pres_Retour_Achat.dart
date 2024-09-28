import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/achatssRetour/showCancledFacture_retour_Achat.dart';
import 'package:stock_dz_app/pages/achatssRetour/showFacture_retour_achat.dart';
import '../client_pages/show_client.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import '/pages/achatssRetour/Show_Fournisseure_Retour.dart';

class PresRetourAchat extends StatefulWidget {
  const PresRetourAchat({super.key});

  @override
  State<PresRetourAchat> createState() => _PresRetourAchatState();
}

class _PresRetourAchatState extends State<PresRetourAchat> {
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
                    "                                                            عرض الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowFournisseureRetour()),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                عرض فواتير المرتجعات",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowfactureRetourAchat(
                              label: 'عرض فواتير المرتجعات',
                            )),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                         تقرير  المرتجعات",
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
                    "                                  فواتير المرتجعات التي تم الغاءها ",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowcancledfactureRetourAchat()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
