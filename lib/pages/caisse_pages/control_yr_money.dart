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
        title: Text('حاسب نفسك'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            "      اختر الفترة الزمنية",
            style: TextStyle(fontSize: 20),
          ),
          CustomDate(),
          SizedBox(
            height: 20,
          ),
          customtextfield(
              label:
                  '                                            ادخل المبلغ الدي عندك ',
              icon: (Icons.money),
              controller: controller1),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                //child:Text(item),
                height: 50,
                width: 200,
                color: const Color.fromARGB(255, 226, 209, 209),
              ),
              SizedBox(width: 10),
              Text(
                ":رصيد الصندوق",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                //child:Text(item),
                height: 50,
                width: 200,
                color: const Color.fromARGB(255, 226, 209, 209),
              ),
              SizedBox(width: 10),
              Text(
                "            : الفرق",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          customControl(label: 'رصيد الصندوق'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Text(
              "المداخل - المخارج = رصيد الصندوق",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          customControl(
            label: '                   :المداخل',
          ),
          SizedBox(
            height: 10,
          ),
          customControl(label: '        :مدفوعات المبيعات '),
          SizedBox(
            height: 10,
          ),
          customControl(label: 'مدفوعات الزبون  '),
          SizedBox(
            height: 10,
          ),
          customControl(label: '          :مرتجعات من الشراء'),
          SizedBox(
            height: 10,
          ),
          customControl(label: '                            :المخارج'),
          SizedBox(
            height: 10,
          ),
          customControl(label: '           :مدفوعات الموردين'),
          SizedBox(
            height: 10,
          ),
          customControl(label: '             :المرتجعات للزبون'),
          SizedBox(
            height: 10,
          ),
          customControl(label: '                       : المصاريف'),
          SizedBox(
            height: 10,
          ),
          customControl(label: '            : خصم من الصندوق'),
        ]),
      ),
    );
  }
}
