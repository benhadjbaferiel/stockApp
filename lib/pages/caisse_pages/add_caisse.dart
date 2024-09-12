import 'package:flutter/material.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';
import 'package:stock_dz_app/widgets.dart/custom_text_field.dart';
import 'package:stock_dz_app/widgets.dart/in_Kwell_Custom.dart';

class add_caisse extends StatefulWidget {
  const add_caisse({super.key});

  @override
  State<add_caisse> createState() => _add_caisseState();
}

class _add_caisseState extends State<add_caisse> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  int? selectedCheckboxIndex;
  TextEditingController money = TextEditingController();
  TextEditingController edit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الصندوق"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16), // Adjusted to a more appropriate height
            Container(
              width: double.infinity,
              height: 150, // Make sure it fills the width of the screen
              padding: EdgeInsets.all(16), // Add some padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align items to the top
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align items to the start of the container
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: selectedCheckboxIndex == 0,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCheckboxIndex = newValue == true ? 0 : null;
                          });
                          // Add any additional logic here
                        },
                      ),
                      Expanded(
                        child: Text(
                          " خصم من الصندوق ",
                        ),
                      ),
                      Checkbox(
                        value: selectedCheckboxIndex == 1,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCheckboxIndex = newValue == true ? 1 : null;
                          });
                          // Add any additional logic here
                        },
                      ),
                      Expanded(
                        child: Text(
                          "اضافة الى الصندوق ",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  customtextfield(
                      label:
                          '                                                          المبلغ',
                      icon: (Icons.attach_money_outlined),
                      controller: money,
                      keyboardType: TextInputType.number),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomDate(),
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
                label: '                                         البيان',
                icon: (Icons.edit),
                controller: edit),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, // Couleur du texte
                backgroundColor: Colors.grey[200], // Couleur de fond du bouton
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                // Set the button text based on the selected checkbox
                selectedCheckboxIndex == 0
                    ? 'خصم من الصندوق'
                    : selectedCheckboxIndex == 1
                        ? 'اضافة الى الصندوق'
                        : 'اختر عملية',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      color: const Color.fromARGB(255, 226, 209, 209),
                    ),
                    SizedBox(width: 50),
                    Text(
                      ": الرصيد",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            InkwellF(
                label:
                    "                                      تقرير بحركة الاضافة و الخصم",
                callbackHandle: () {},
                Icon: Icons.analytics),
            SizedBox(
              height: 20,
            ),
            InkwellF(
                label:
                    "                                                    تقرير بحركة الصندوق",
                callbackHandle: () {},
                Icon: Icons.analytics)
          ],
        ),
      ),
    );
  }
}
