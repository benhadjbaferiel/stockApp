import 'package:flutter/material.dart';

class CreditClient extends StatelessWidget {
  CreditClient({super.key});
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المبالغ المتبقية للعملاء"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("تقرير"),
                ),
                Expanded(
                  child: TextField(
                    controller: controller1,
                  ),
                )
              ],
            ),
            Container(
                color: Colors.grey[200],
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("بيانات العميل"),
                    SizedBox(
                      width: 200,
                    ),
                    Text(" المبلغ الباقي "),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
