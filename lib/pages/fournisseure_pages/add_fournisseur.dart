import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import '/widgets.dart/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';

class AddFournisseure extends StatelessWidget {
  AddFournisseure({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController AdressController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController NIFController = TextEditingController();
  final TextEditingController AIController = TextEditingController();
  final TextEditingController RCController = TextEditingController();
  final TextEditingController NISController = TextEditingController();
  final TextEditingController categoriController = TextEditingController();

  void _saveFournisseure(BuildContext context) {
    if (nameController.text.isEmpty ||
        AdressController.text.isEmpty ||
        PhoneController.text.isEmpty ||
        NIFController.text.isEmpty ||
        AIController.text.isEmpty ||
        RCController.text.isEmpty ||
        NISController.text.isEmpty) {
      // Show an error message if any required field is missing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول المطلوبة'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Do not proceed with saving the product
    }
    final String name = nameController.text;
    final String address = AdressController.text;
    final int phone = int.tryParse(PhoneController.text) ?? 0;
    final int NIF = int.tryParse(NIFController.text) ?? 0;
    final int AI = int.tryParse(AIController.text) ?? 0;
    final int RC = int.tryParse(RCController.text) ?? 0;
    final int NIS = int.tryParse(NISController.text) ?? 0;
    final String categoryi = categoriController.text.trim();

    final Fournisseure fournisseure = Fournisseure(
      nameF: name,
      addressF: address,
      phoneNumberF: phone,
      NIFF: NIF,
      AIF: AI,
      RCF: RC,
      NISF: NIS,
      categorie1: categoryi,
    );
    Provider.of<FournisseureProvider>(context, listen: false)
        .addFournisseure(fournisseure);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت اضافة المورد بنجاح')),
    );
    nameController.clear();
    PhoneController.clear();
    AdressController.clear();
    NIFController.clear();
    AIController.clear();
    RCController.clear();
    NISController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مورد جديد", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 176, 171, 86),
        actions: [
          TextButton(
            onPressed: () {
              _saveFournisseure(context);
            },
            child: Text('حفظ', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                customtextfield(
                  label:
                      '                                              اسم العميل',
                  icon: Icons.person,
                  controller: nameController,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label:
                      '                                            عنوان المورد',
                  icon: Icons.home,
                  controller: AdressController,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label:
                      '                                         رقم هاتف المورد',
                  icon: Icons.phone,
                  controller: PhoneController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label:
                      '                                    الرقم الجبائي(NIF)',
                  icon: Icons.numbers,
                  controller: NIFController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label:
                      '                                          رقم المادة (AI)',
                  icon: Icons.numbers,
                  controller: AIController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label: '                             رقم السجل التجاري (RC)',
                  icon: Icons.numbers,
                  controller: RCController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                customtextfield(
                  label: '                          رقم التعرف الاحصائي(NIS)',
                  icon: Icons.numbers,
                  controller: NISController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
