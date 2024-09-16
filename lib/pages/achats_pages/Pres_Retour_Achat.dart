import 'package:flutter/material.dart';
import '../client_pages/show_client.dart';
import '/widgets.dart/in_Kwell_Custom.dart';
import '/pages/Achats_pages/Show_Fournisseure_Retour.dart';

class PresRetourAchat extends StatelessWidget {
  const PresRetourAchat({super.key});

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
                    "                                                                عرض الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowFournisseureRetour()),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                     عرض فواتير المرتجعات",
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
                    "                                                              تقرير  المرتجعات",
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
                    "                                        فواتير المرتجعات التي تم الغاءها ",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowClient()),
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
