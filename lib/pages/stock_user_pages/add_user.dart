import 'package:flutter/material.dart';
import 'package:stock_dz_app/pages/stock_user_pages/show_user.dart';
import 'package:stock_dz_app/pages/stock_user_pages/user.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController username = TextEditingController();
  TextEditingController code = TextEditingController();
  bool boolValue = true;
  bool boolValue1 = true;
  bool boolValue2 = true;
  bool boolValue3 = true;
  bool boolValue4 = true;
  bool boolValue5 = true;
  bool boolValue6 = true;
  bool boolValue7 = true;
  bool boolValue8 = true;
  bool boolValue9 = true;
  bool boolValue10 = true;
  bool boolValue11 = true;
  bool boolValue12 = true;
  bool boolValue13 = true;
  bool boolValue14 = true;
  bool boolValue15 = true;
  bool boolValue16 = true;
  bool boolValue17 = true;
  bool boolValue18 = true;
  bool boolValue19 = true;
  bool boolValue20 = true;
  bool boolValue21 = true;
  bool boolValue22 = true;
  bool boolValue23 = true;
  bool boolValue24 = true;
  bool boolValue25 = true;
  bool boolValue26 = true;
  bool boolValue27 = true;
  bool boolValue28 = true;
  bool boolValue29 = true;
  bool boolValue30 = true;
  bool boolValue31 = true;
  bool boolValue32 = true;
  bool boolValue33 = true;
  bool boolValue34 = true;
  bool boolValue35 = true;
  bool boolValue36 = true;
  bool boolValue37 = true;
  bool boolValue38 = true;
  bool boolValue39 = true;
  bool boolValue40 = true;
  bool boolValue41 = true;
  bool boolValue42 = true;
  bool boolValue43 = true;
  bool boolValue44 = true;
  bool boolValue45 = true;
  bool boolValue46 = true;
  bool boolValue47 = true;
  bool boolValue48 = true;
  bool boolValue49 = true;
  bool boolValue50 = true;
  bool boolValue51 = true;
  bool boolValue52 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مستخدم"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 245, 242, 242)),
                  child: TextField(
                    controller: username,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "اسم المستخدم",
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
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 245, 242, 242)),
                  child: TextField(
                    controller: code,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "    الرقم السري",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              "                      صلاحيات المستخدم",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "(وضع الامان)",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Checkbox(
                  value: boolValue, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue = newValue ?? false;
                    });
                  },
                ),
                Text(
                  "كل الصلاحيات ",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue1, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue1 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                           المبيعات",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue2, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue2 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 135,
                ),
                Text(
                  "عرض فواتير المبيعات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue3, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue3 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 188,
                ),
                Text(
                  "تقرير المبيعات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue4, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue4 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 165,
                ),
                Text(
                  "تقرير بالخصومات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue5, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue5 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  "الفواتير التي تم الغاءها-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue6, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue6 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 144,
                ),
                Text(
                  "تعديل تاريخ الفاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue7, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue7 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 134,
                ),
                Text(
                  "تعديل اسعار المنتجات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue8, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue8 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 162,
                ),
                Text(
                  "منع البيع الا بالنقد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue9, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue9 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "منع الخصم-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue10, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue10 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "تعديل فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue11, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue11 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "الغاء فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue12, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue12 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                          المشتريات",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue13, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue13 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 135,
                ),
                Text(
                  "عرض فواتير المشتريات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue14, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue14 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 188,
                ),
                Text(
                  "تقرير المشتريات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue15, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue15 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 165,
                ),
                Text(
                  "تقرير بالخصومات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue16, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue16 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  "الفواتير التي تم الغاءها-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue17, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue17 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 144,
                ),
                Text(
                  "تعديل تاريخ الفاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue18, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue18 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 134,
                ),
                Text(
                  "تعديل اسعار المنتجات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue19, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue19 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 162,
                ),
                Text(
                  "منع الشراءالا بالنقد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue20, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue20 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "منع الخصم-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue21, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue21 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "تعديل فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue22, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue22 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "الغاء فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue23, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue23 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                         ارجاع المبيعات",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue24, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue24 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 135,
                ),
                Text(
                  "عرض فواتير المرتجعات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue25, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue25 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 144,
                ),
                Text(
                  "تعديل تاريخ الفاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue26, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue26 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 134,
                ),
                Text(
                  "تعديل اسعار المنتجات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue27, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue27 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 145,
                ),
                Text(
                  "منع الارجاع الا بالنقد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue28, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue28 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "تعديل فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue29, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue29 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "الغاء فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue30, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue30 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                         ارجاع المشتريات",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue31, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue31 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 135,
                ),
                Text(
                  "عرض فواتير المرتجعات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue32, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue32 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 144,
                ),
                Text(
                  "تعديل تاريخ الفاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue33, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue33 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 134,
                ),
                Text(
                  "تعديل اسعار المنتجات-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue34, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue34 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 145,
                ),
                Text(
                  "منع الارجاع الا بالنقد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue35, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue35 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "تعديل فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue36, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue36 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  "الغاء فاتورة-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue37, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue37 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                          الموردين",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue38, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue38 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 205,
                ),
                Text(
                  "  اضافة مورد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue39, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue39 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 215,
                ),
                Text(
                  "  ذمم مورد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue40, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue40 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 182,
                ),
                Text(
                  "تسديد دين مورد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue41, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue41 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  "تعديل تاريخ التسديد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue42, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue42 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                          العملاء",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue43, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue43 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 205,
                ),
                Text(
                  "اضافة عميل-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue44, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue44 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 215,
                ),
                Text(
                  "ذمم العملاء-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue45, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue45 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 182,
                ),
                Text(
                  "تسديد دين عميل-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue46, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue46 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  "تعديل تاريخ التسديد-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue47, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue47 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                          الصندوق",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue48, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue48 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 140,
                ),
                Text(
                  "اضافة مبلغ للصندوق-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue49, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue49 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 180,
                ),
                Text(
                  "تعديل التاريخ -",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Checkbox(
                    value: boolValue50, // the value of the checkbox
                    onChanged: (bool? newValue) {
                      // callback when the checkbox is changed
                      setState(() {
                        boolValue50 = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    "                          المصاريف",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue51, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue51 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 180,
                ),
                Text(
                  "اضافة مصروف-",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: boolValue52, // the value of the checkbox
                  onChanged: (bool? newValue) {
                    // callback when the checkbox is changed
                    setState(() {
                      boolValue52 = newValue ?? false;
                    });
                  },
                ),
                SizedBox(
                  width: 170,
                ),
                Text(
                  "عرض المصاريف -",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
