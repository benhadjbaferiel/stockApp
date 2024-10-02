import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Models/product_category_model.dart';
import 'package:stock_dz_app/providers/category_provider.dart';

class editPrice extends StatefulWidget {
  const editPrice({super.key});

  @override
  State<editPrice> createState() => _editPriceState();
}

class _editPriceState extends State<editPrice> {
  String groupValue = 'بالزيادة';
  String groupValue1 = 'مبلغ';
  int _selectedOption = 0;
  int _selectedOption1 = 0;
  int _selectedOption2 = 0;

  bool? isCheked1 = false;
  bool? isCheked2 = true;
  bool? isCheked3 = false;
  bool? isCheked4 = true;
  bool? isCheked5 = false;
  bool? isCheked6 = true;
  TextEditingController prixController = TextEditingController();
  TextEditingController Controller1 = TextEditingController();
  TextEditingController Controller2 = TextEditingController();

  CategoryProduct? selectedCategory; // To store selected category

  @override
  Widget build(BuildContext context) {
    // Access categories from the provider
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;

    return Scaffold(
        appBar: AppBar(
          title: const Text("تعديل اسعار المنتجات"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 176, 171, 86),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10.0),
          const Text(
            '                                               التاثير على الاسعار',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.grey[200],
            child: Row(
              children: [
                const SizedBox(width: 40),
                Radio(
                  value: "بالزيادة",
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                ),
                const Text("بالزيادة", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 70),
                Radio(
                  value: "بالنقصان",
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                ),
                const Text("بالنقصان", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            '                                                          تعديل سعر',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.grey[200],
            child: Row(
              children: [
                const SizedBox(width: 40),
                Radio<int>(
                  value: 0,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                const Text("البيع", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 70),
                Radio<int>(
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                const Text("الشراء", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _selectedOption == 0 ? 123 : 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: _selectedOption == 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isCheked1,
                            activeColor: Colors.green,
                            onChanged: (newbool) {
                              setState(() {
                                isCheked1 = newbool;
                              });
                            },
                          ),
                          const Text("سعر البيع4",
                              style: TextStyle(fontSize: 9)),
                          Checkbox(
                            value: isCheked4,
                            activeColor: Colors.green,
                            onChanged: (newbool) {
                              setState(() {
                                isCheked4 = newbool;
                              });
                            },
                          ),
                          const Text("سعر البيع3",
                              style: TextStyle(fontSize: 9)),
                          Checkbox(
                            value: isCheked3,
                            activeColor: Colors.green,
                            onChanged: (newbool) {
                              setState(() {
                                isCheked3 = newbool;
                              });
                            },
                          ),
                          const Text("سعر البيع2",
                              style: TextStyle(fontSize: 9)),
                          Checkbox(
                            value: isCheked2,
                            activeColor: Colors.green,
                            onChanged: (newbool) {
                              setState(() {
                                isCheked2 = newbool;
                              });
                            },
                          ),
                          const Text("سعر البيع1",
                              style: TextStyle(fontSize: 9)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                              "                                             التعديل حسب التصنيف",
                              style: TextStyle(fontSize: 16)),
                          DropdownButtonFormField<CategoryProduct>(
                            hint: const Text('اختر تصنيف'),
                            value: selectedCategory,
                            items: categories.map((category) {
                              return DropdownMenuItem<CategoryProduct>(
                                value: category,
                                child: Text(category.name),
                              );
                            }).toList(),
                            onChanged: (CategoryProduct? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Text("التعديل حسب التصنيف",
                          style: TextStyle(fontSize: 16)),
                      DropdownButtonFormField<CategoryProduct>(
                        hint: const Text('اختر تصنيف'),
                        value: selectedCategory,
                        items: categories.map((category) {
                          return DropdownMenuItem<CategoryProduct>(
                            value: category,
                            child: Text(category
                                .name), // Assuming CategoryProduct has a name property
                          );
                        }).toList(),
                        onChanged: (CategoryProduct? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
          ),
          Text("                                          الطريقة",
              style: TextStyle(fontSize: 25)),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Radio(
                value: "%نسبة",
                groupValue: groupValue1,
                onChanged: (value) {
                  setState(() {
                    groupValue1 = value!;
                  });
                },
              ),
              const Text("%نسبة", style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 10,
              ),
              Radio(
                value: "مبلغ",
                groupValue: groupValue1,
                onChanged: (value) {
                  setState(() {
                    groupValue1 = value!;
                  });
                },
              ),
              const Text("مبلغ", style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 10,
              ),
              Radio(
                value: "سعر الصرف",
                groupValue: groupValue1,
                onChanged: (value) {
                  setState(() {
                    groupValue1 = value!;
                  });
                },
              ),
              const Text("سعر الصرف", style: TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _selectedOption1 == 0
                ? 80
                : _selectedOption1 == 1
                    ? 80
                    : 80,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 253, 248, 248)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(groupValue1 == "%نسبة"
                        ? "نسبة:"
                        : groupValue1 == "مبلغ"
                            ? "مبلغ:"
                            : "سعر الصرف:"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: groupValue1 == "%نسبة"
                            ? Controller1
                            : groupValue1 == "مبلغ"
                                ? prixController
                                : Controller2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: groupValue1 == "%نسبة"
                              ? "أدخل النسبة"
                              : groupValue1 == "مبلغ"
                                  ? "أدخل المبلغ"
                                  : "أدخل سعر الصرف",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child:
                ElevatedButton(onPressed: () {}, child: Text("تعديل الاسعار")),
          )
        ])));
  }
}
