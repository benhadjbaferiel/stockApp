import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/client_model.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import '/widgets.dart/custom_text_field.dart';
import '/widgets.dart/drop_Down_Button.dart';
import 'package:provider/provider.dart';

class AddClient extends StatefulWidget {
  AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final formKey1 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController barCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nifController = TextEditingController();
  final TextEditingController aiController = TextEditingController();
  final TextEditingController rcController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController maxController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  String? selectedPrice;
  String? selectedCategory2;

  void saveClient(BuildContext context) async {
    if (formKey1.currentState!.validate()) {
      if (nameController.text.isEmpty ||
          barCodeController.text.isEmpty ||
          addressController.text.isEmpty ||
          phoneController.text.isEmpty ||
          nifController.text.isEmpty ||
          aiController.text.isEmpty ||
          rcController.text.isEmpty ||
          nisController.text.isEmpty ||
          daysController.text.isEmpty ||
          maxController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى ملء جميع الحقول المطلوبة'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (selectedCategory2 == null || selectedCategory2 == "---") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى تحديد التصنيف'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      //--------------------------------------
      print('barcode : ${int.tryParse(barCodeController.text)}');
      print('price : ${double.tryParse(priceController.text)}');

      int? categoryId =
          await Provider.of<ClientProvider>(context, listen: false)
              .getCategoryId(selectedCategory2!);

      final Clientt client = Clientt(
          name: nameController.text,
          barcode: int.tryParse(barCodeController.text) ?? 0,
          address: addressController.text,
          phoneNumber: int.tryParse(phoneController.text) ?? 0,
          Price: double.tryParse(priceController.text) ?? 0.0,
          NIF: int.tryParse(nifController.text) ?? 0,
          AI: int.tryParse(aiController.text) ?? 0,
          RC: int.tryParse(rcController.text) ?? 0,
          NIS: int.tryParse(nisController.text) ?? 0,
          MAX: int.tryParse(maxController.text) ?? 0,
          DAYS: int.tryParse(daysController.text) ?? 0,
          idC: categoryId);
// here i have to add await
      Provider.of<ClientProvider>(context, listen: false).addClients(client);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت اضافة العميل بنجاح')),
      );

      // Clear fields after saving
      nameController.clear();
      barCodeController.clear();
      addressController.clear();
      phoneController.clear();
      priceController.clear();
      nifController.clear();
      aiController.clear();
      rcController.clear();
      nisController.clear();
      maxController.clear();
      daysController.clear();
      categoryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اضافة عميل جديد",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 176, 171, 86),
        actions: [
          TextButton(
            onPressed: () {
              saveClient(context);
            },
            child: Text(
              'حفظ',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customtextfield(
                      label: 'اسم العميل',
                      icon: Icons.person,
                      controller: nameController,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'باركود العميل',
                      icon: Icons.barcode_reader,
                      controller: barCodeController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'عنوان العميل',
                      icon: Icons.home,
                      controller: addressController,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'رقم هاتف العميل',
                      icon: Icons.phone,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 5),
                    dropDownButton(
                      selectedValue: selectedPrice,
                      labelText: 'سعر بيع للعميل',
                      items: ["سعر البيع 1", "سعر البيع 2", "سعر البيع 3"],
                      controller: priceController,
                    ),
                    const SizedBox(height: 5),
                    dropDownButton(
                      selectedValue: selectedCategory2,
                      labelText: 'التصنيف',
                      items: Provider.of<ClientProvider>(context).categories,
                      controller: categoryController,
                      onChanged: (String? NewValue) {
                        setState(() {
                          selectedCategory2 = NewValue;
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'الرقم الضريبي للعميل (NIF)',
                      icon: Icons.numbers,
                      controller: nifController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'رقم المادة (AI)',
                      icon: Icons.numbers,
                      controller: aiController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'رقم السجل التجاري (RC)',
                      icon: Icons.numbers,
                      controller: rcController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'رقم التعرف الاحصائي (NIS)',
                      icon: Icons.numbers,
                      controller: nisController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'سقف العميل',
                      icon: Icons.money_off,
                      controller: maxController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 5),
                    customtextfield(
                      label: 'عدد الأيام',
                      icon: Icons.timelapse,
                      controller: daysController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
