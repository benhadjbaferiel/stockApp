import 'package:flutter/material.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';

class ShowDepances extends StatelessWidget {
  const ShowDepances({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عرض المصاريف "),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            "                                     اختر الفترة الزمنية",
            style: TextStyle(fontSize: 20),
          ),
          CustomDate(),
        ]),
      ),
    );
  }
}
