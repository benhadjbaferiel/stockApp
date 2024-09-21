import 'package:flutter/material.dart';
import '/widgets.dart/Custom_Date.dart';

class Custombar extends StatefulWidget {
  const Custombar({Key? key}) : super(key: key);

  @override
  State<Custombar> createState() => _CustombarState();
}

class _CustombarState extends State<Custombar> {
  String groupValue = "طلب شراء";
  TextEditingController versementController = TextEditingController();
  TextEditingController reductionController = TextEditingController();
  TextEditingController TaxController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController remarqueController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              height: 420,
              width: double.infinity,
              child: Column(
                children: [
                  // Horizontal scrolling Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        StatefulBuilder(
                          builder: (context, setInnerState) {
                            return Row(
                              children: [
                                Radio<String>(
                                  value: "طلب شراء",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("طلب شراء"),
                                Radio<String>(
                                  value: "نقدا",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("نقدا"),
                                SizedBox(width: 20),
                                Radio<String>(
                                  value: "اجل",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("اجل"),
                                SizedBox(width: 20),
                                Radio<String>(
                                  value: "بطاقة",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("بطاقة"),
                                SizedBox(width: 20),
                                Radio<String>(
                                  value: "اذن استلام مخزني",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("اذن استلام مخزني"),
                                SizedBox(width: 20),
                                Radio<String>(
                                  value: "شيك",
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setInnerState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                Text("شيك"),
                                SizedBox(width: 15),
                                Text(
                                  "طريقة الدفع",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 248),
                          border: Border.all(width: 1),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "الاجمالي",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 248),
                          border: Border.all(width: 1),
                        ),
                        child: TextField(
                          controller: versementController,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "المدفوع",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 248),
                          border: Border.all(width: 1),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "الباقي",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 248),
                            border: Border.all(width: 1),
                          ),
                          child: TextField(
                            controller: TaxController,
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Text("الضريبة"),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 248),
                          border: Border.all(width: 1),
                        ),
                        child: Text(
                          " %",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 248),
                          border: Border.all(width: 1),
                        ),
                        child: TextField(
                          controller: reductionController,
                        ),
                      ),
                      Text("الخصم"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "حفظ الفاتورة لحساب مورد",
                    style: TextStyle(fontSize: 21),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 248),
                      border: Border.all(width: 1),
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: '          ابحث عن مورد او ادخل اسم'),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 248),
                      border: Border.all(width: 1),
                    ),
                    child: TextField(
                      controller: remarqueController,
                      decoration: InputDecoration(
                          hintText: '          ابحث عن مورد او ادخل اسم'),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Update the main widget's state here if needed
                setState(() {});
              },
              child: Text("متابعة"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("تراجع"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        width: 370,
        color: const Color.fromARGB(255, 246, 245, 245),
        child: Row(
          children: [
            CustomDate(),
            const SizedBox(width: 45),
            const Text(
              "تاريخ الفاتورة",
              style: TextStyle(fontSize: 23, color: Colors.grey),
            ),
          ],
        ),
      ),
      TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(width: 0.8),
          ),
          hintText: "          ابحث عن منتج او استخدم الكاميرا",
          prefixIcon: IconButton(
            icon: Icon(Icons.save, size: 30),
            onPressed: _showDialog,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.qr_code, size: 30),
            onPressed: () {},
          ),
        ),
      )
    ]);
  }
}
