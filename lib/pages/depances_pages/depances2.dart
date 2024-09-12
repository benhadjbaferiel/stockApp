import 'package:flutter/material.dart';
import '/widgets.dart/Custom_Date.dart';
// Pour formater la date

class Depances2 extends StatefulWidget {
  const Depances2({super.key});

  @override
  State<Depances2> createState() => _Depances2State();
}

class _Depances2State extends State<Depances2> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _statementController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String _selectedPaymentMethod = 'من الصندوق';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
              ),
              Row(
                children: [
                  const Text(
                    "  المصروفات",
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(width: 50),
                  Image.asset(
                    'icons/13.png',
                    width: 100,
                    height: 100,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _buildTextField(
                        _accountController, '  اكتب اسم الحساب', 'الحساب'),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                        _statementController, ' اكتب البيان', 'البيان'),
                    const SizedBox(height: 16.0),
                    _buildTextField(_amountController, '0', 'ادخل المبلغ',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 16.0),
                    _buildPaymentMethodSelection(),
                    const SizedBox(height: 16.0),
                    CustomDate(),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Logique de sauvegarde
                      },
                      child: const Text('حفظ'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildRadioOption('من الصندوق'),
        _buildRadioOption('ببطاقه'),
        _buildRadioOption('شيك'),
      ],
    );
  }

  Widget _buildRadioOption(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _selectedPaymentMethod,
          onChanged: (String? newValue) {
            setState(() {
              _selectedPaymentMethod = newValue!;
            });
          },
        ),
        Text(value),
      ],
    );
  }
}
