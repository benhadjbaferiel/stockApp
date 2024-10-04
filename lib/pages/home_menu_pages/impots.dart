import 'package:flutter/material.dart';
import '/widgets.dart/Custom_Impot.dart';

class TaxPage extends StatefulWidget {
  @override
  _TaxPageState createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  bool impot1 = false;
  bool impot2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TAX الضرائب'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("النسبة%", textAlign: TextAlign.center)),
                      Expanded(
                          flex: 2,
                          child: Text(
                              "                                                    الاختصار",
                              textAlign: TextAlign.center)),
                      Expanded(
                          flex: 2,
                          child: Text("              اسم الضريبة",
                              textAlign: TextAlign.center)),
                    ],
                  ),
                  const CustomImpot(label: 'ضريبة 1', label2: 'TAX1'),
                  const CustomImpot(label: 'ضريبة2', label2: 'TAX2'),
                  const CustomImpot(label: 'ضريبة3', label2: 'TAX3'),
                  const CustomImpot(label: 'ضريبة4', label2: 'TAX4'),
                  const CustomImpot(label: 'ضريبة5', label2: 'TAX5'),
                  SwitchListTile(
                      value: impot1,
                      title: const Text("قيمة المنتج شامل الضريبة"),
                      onChanged: (bool value) {
                        setState(() {
                          impot1 = value;
                        });
                      }),
                  const Divider(),
                  SwitchListTile(
                      value: impot2,
                      title: const Text(
                          "احتساب الضريبة من اجمالي صافي الفاتورة بعد الخصم"),
                      onChanged: (bool value) {
                        setState(() {
                          impot2 = value;
                        });
                      }),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "حفظ",
                        style: TextStyle(fontSize: 25),
                      ))
                ]),
          ),
        ));
  }
}
