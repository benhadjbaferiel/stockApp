import 'package:flutter/material.dart';
import '../client_pages/show_client.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class PresVentes extends StatelessWidget {
  const PresVentes({super.key});

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
                    MaterialPageRoute(builder: (context) => ShowClient()),
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
              const SizedBox(
                height: 30,
              ),
              InkwellF(
                label:
                    "                                                         تقرير بالخصومات   ",
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
                    "                                                     الفواتير التي تم الغاءها  ",
                Icon: Icons.view_list_outlined,
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
            ],
          ),
        ),
      ),
    );
  }
}
