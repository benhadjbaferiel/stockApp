import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/widgets.dart/drop_Down_Button.dart';
import '/widgets.dart/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';

class AddFournisseure extends StatefulWidget {
  AddFournisseure({Key? key}) : super(key: key);

  @override
  State<AddFournisseure> createState() => _AddFournisseureState();
}

class _AddFournisseureState extends State<AddFournisseure> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController AdressController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController NIFController = TextEditingController();
  final TextEditingController AIController = TextEditingController();
  final TextEditingController RCController = TextEditingController();
  final TextEditingController NISController = TextEditingController();
  final TextEditingController categoriController = TextEditingController();

  String? selectedCategory1;
  void _saveFournisseure(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (nameController.text.isEmpty ||
          AdressController.text.isEmpty ||
          PhoneController.text.isEmpty ||
          NIFController.text.isEmpty ||
          AIController.text.isEmpty ||
          RCController.text.isEmpty ||
          NISController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى ملء جميع الحقول المطلوبة  '),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (selectedCategory1 == null || selectedCategory1 == "---") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى تحديد التصنيف'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Get the category ID from the categories list directly
      int categoryId = Provider.of<FournisseureProvider>(context, listen: false)
          .categories1
          .indexOf(selectedCategory1!);

      if (categoryId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid category selected')),
        );
        return;
      }

      final fournisseur = Fournisseure(
        nameF: nameController.text,
        addressF: AdressController.text,
        phoneNumberF: int.tryParse(PhoneController.text) ?? 0,
        NIFF: int.tryParse(NIFController.text) ?? 0,
        AIF: int.tryParse(AIController.text) ?? 0,
        RCF: int.tryParse(RCController.text) ?? 0,
        NISF: int.tryParse(NISController.text) ?? 0,
        categorie_id: categoryId, // Using category ID
      );

      Provider.of<FournisseureProvider>(context, listen: false)
          .addFournisseur(fournisseur);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت اضافة المورد بنجاح')),
      );

      // Clear the fields
      nameController.clear();
      PhoneController.clear();
      AdressController.clear();
      NIFController.clear();
      AIController.clear();
      RCController.clear();
      NISController.clear();
    }
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
                const SizedBox(height: 20),
                dropDownButton(
                  selectedValue: selectedCategory1,
                  labelText:
                      '                                               التصنيف',
                  items: Provider.of<FournisseureProvider>(context).categories1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory1 = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
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
                Container(
                  child: TextButton(
                    onPressed: () {
                      _saveFournisseure(context);
                    },
                    child: Text('حفظ', style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
