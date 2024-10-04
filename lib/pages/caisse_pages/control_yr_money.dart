import 'package:flutter/material.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';
import 'package:stock_dz_app/widgets.dart/custom_text_field.dart';
import 'package:stock_dz_app/widgets.dart/customcontrol.dart';

class Control extends StatefulWidget {
  Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسب نفسك'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            "      اختر الفترة الزمنية",
            style: TextStyle(fontSize: 20),
          ),
          CustomDate(),
          const SizedBox(
            height: 20,
          ),
          customtextfield(
              label:
                  '                                            ادخل المبلغ الدي عندك ',
              icon: (Icons.money),
              controller: controller1),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                //child:Text(item),
                height: 50,
                width: 200,
                color: const Color.fromARGB(255, 226, 209, 209),
              ),
              const SizedBox(width: 10),
              const Text(
                "            : الفرق",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '                :رصيد الصندوق'),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(children: [
                Container(
                  height: 50,
                  width: 200,
                  color: const Color.fromARGB(255, 226, 209, 209),
                  //child:,
                ),
                const Text(
                  "          :المداخل",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ])),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '          :مدفوعات المبيعات'),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '            :مدفوعات الزبون'),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '       :مرتجعات من الشراء'),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(children: [
                Container(
                  height: 50,
                  width: 200,
                  color: const Color.fromARGB(255, 226, 209, 209),
                  //child:,
                ),
                const Text(
                  "          :المخارج",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ])),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '           :مدفوعات الموردين'),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '             :المرتجعات للزبون'),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '                       : المصاريف'),
          const SizedBox(
            height: 10,
          ),
          const customControl(label: '           : خصم من الصندوق'),
        ]),
      ),
    );
  }
}
