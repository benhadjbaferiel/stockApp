import 'package:flutter/material.dart';

class CreditFournisseure extends StatelessWidget {
  CreditFournisseure({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المبالغ المتبقية للموردين"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 225, 168),
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
                    controller: _controller,
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
                    Text("بيانات المورد"),
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
