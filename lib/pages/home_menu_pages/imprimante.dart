import 'package:flutter/material.dart';
import 'package:stock_dz_app/widgets.dart/custom_dropdown_impot.dart';
import 'package:stock_dz_app/widgets.dart/tewtfield_impot.dart';

class Imprimante extends StatefulWidget {
  Imprimante({super.key});

  @override
  _ImprimanteState createState() => _ImprimanteState();
}

class _ImprimanteState extends State<Imprimante> {
  bool imprim1 = false;
  bool imprim2 = true;
  bool imprim3 = false;
  bool imprim4 = false;
  bool imprim5 = false;
  bool imprim6 = true;
  bool imprim7 = false;
  bool imprim8 = true;
  bool imprim9 = true;
  bool imprim10 = false;
  bool imprim11 = true;

  final List<int> copies = [1, 2, 3, 4, 5];
  int selectedCopies = 1;

  String printerType = 'PDF';
  String paperSize = '80mm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إعدادات الطابعه'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '                            نوع الطابعه',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 200,
                width: 350,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'PDF',
                          groupValue: printerType,
                          onChanged: (value) {
                            setState(() {
                              printerType = value!;
                            });
                          },
                        ),
                        Text('PDF'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Bluetooth',
                          groupValue: printerType,
                          onChanged: (value) {
                            setState(() {
                              printerType = value!;
                            });
                          },
                        ),
                        Text('Bluetooth'),
                        Text('58/80mm'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'WIFI',
                          groupValue: printerType,
                          onChanged: (value) {
                            setState(() {
                              printerType = value!;
                            });
                          },
                        ),
                        Text('WIFI'),
                        Text('58/80mm'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'USB',
                          groupValue: printerType,
                          onChanged: (value) {
                            setState(() {
                              printerType = value!;
                            });
                          },
                        ),
                        Text('USB'),
                        Text('58/80mm'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'DC:0D:30:79:93:6E',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add search functionality here
                    },
                    child: Text('بحث'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Radio<String>(
                    value: '80mm',
                    groupValue: paperSize,
                    onChanged: (value) {
                      setState(() {
                        paperSize = value!;
                      });
                    },
                  ),
                  Text('80mm'),
                  SizedBox(width: 3.0),
                  Radio<String>(
                    value: '58mm',
                    groupValue: paperSize,
                    onChanged: (value) {
                      setState(() {
                        paperSize = value!;
                      });
                    },
                  ),
                  Text('58mm'),
                  SizedBox(width: 2),
                  Text('حجم ورق الطابعه الحراريه'),
                ],
              ),
              Text(
                  '                                                  نص اسفل فاتورة البيع'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                  '                                    A4 نص اسفل التقارير قياس '),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text('موقع النص الارتفاع'),
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 10.0),
              CustomImpot1(label: "موديل الطابعه الحراريه"),
              SizedBox(height: 10.0),
              CustomImpot1(label: "موديل طابعة الباركود"),
              SizedBox(height: 10.0),
              CustomImpot1(label: "عدد نسخ الفاتورة"),
              SizedBox(height: 10.0),
              CustomImpot1(label: "امر قص الورق"),
              SizedBox(height: 10.0),
              CustomImpot1(label: "امر فتح الدرج"),
              SizedBox(height: 10.0),
              textimpot(label: '                    حجم الخط'),
              SizedBox(height: 10.0),
              textimpot(label: '                  الهامش الايمن'),
              SizedBox(height: 10.0),
              textimpot(label: '                  الهامش الايسر'),
              SwitchListTile(
                  value: imprim1,
                  title:
                      const Text("اظهار عنوان العميل ورقم الهاتف في الفاتورة"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim1 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim2,
                  title: const Text("اظهار مديونية العميل السابقة في الفاتورة"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim2 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim3,
                  title: const Text(
                      "احتساب الضريبة من اجمالي صافي الفاتورة بعد الخصم"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim3 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim4,
                  title: const Text("طباعة اسم المنتج في صف مستقل"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim4 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim5,
                  title: const Text("عرض تاريخ الانتهاء في فاتورة المبيعات A4"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim5 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim6,
                  title: const Text("عرض رقم المنتج في فاتورة المبيعات A4"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim6 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim7,
                  title: const Text("اظهار وصف المنتج في الفاتورة"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim7 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim8,
                  title:
                      const Text(" عند ارسال  فاتورة البيع  A4   اختيار قياس"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim8 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim9,
                  title: const Text("طباعة الفاتورة مباشرة بعد الحفظ"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim9 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim10,
                  title: const Text("   الضريبة في فاتورة البيعQRاظهار "),
                  onChanged: (bool value) {
                    setState(() {
                      imprim10 = value;
                    });
                  }),
              Divider(),
              SwitchListTile(
                  value: imprim11,
                  title: const Text("اظهار صورة المنتج في فاتورة البيع"),
                  onChanged: (bool value) {
                    setState(() {
                      imprim11 = value;
                    });
                  }),
              Divider(),
              Row(
                children: [
                  Text("تعديل مسميات الفاتورة"),
                  ElevatedButton(onPressed: () {}, child: Text("تعديل"))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Save functionality here
                  },
                  child: Text('حفظ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
