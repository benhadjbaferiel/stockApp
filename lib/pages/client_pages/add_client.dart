import 'package:flutter/material.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import '/widgets.dart/custom_text_field.dart';
import '/widgets.dart/drop_Down_Button.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Services/save_Client.dart';

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
  String? selectedCategory;

  late ClientSaved clientSaved;

  @override
  void initState() {
    super.initState();
    clientSaved = ClientSaved(
      nameController: nameController,
      barCodeController: barCodeController,
      addressController: addressController,
      phoneController: phoneController,
      priceController: priceController,
      nifController: nifController,
      aiController: aiController,
      rcController: rcController,
      nisController: nisController,
      maxController: maxController,
      daysController: daysController,
      categoryController: categoryController,
    );
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
              clientSaved.saveClient(context);
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
                      selectedValue: selectedCategory,
                      labelText: 'التصنيف',
                      items: Provider.of<ClientProvider>(context).categories,
                      controller: categoryController,
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
