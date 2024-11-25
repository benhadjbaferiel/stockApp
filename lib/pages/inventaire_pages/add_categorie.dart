import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Models/product_category_model.dart';
import 'package:stock_dz_app/providers/category_provider.dart';

class addCategory extends StatefulWidget {
  const addCategory({super.key});

  @override
  State<addCategory> createState() => _addCategoryState();
}

class _addCategoryState extends State<addCategory> {
  final TextEditingController _tasniifController = TextEditingController();

  void initState() {
    super.initState();
    // Load the suppliers only once
    Provider.of<CategoryProvider>(context, listen: false).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة تصنيف جديد"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
        actions: [
          IconButton(
              onPressed: () {
                if (_tasniifController.text.isNotEmpty) {
                  Provider.of<CategoryProvider>(context, listen: false)
                      .addCategory(CategoryProduct(
                    CategoryPname: _tasniifController.text,
                  ));
                  Provider.of<CategoryProvider>(context, listen: false)
                      .loadCategories();
                  _tasniifController.clear();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "                             ادخل اسم التصنيف الجديد",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 252, 246, 246)),
                      child: TextField(
                        controller: _tasniifController,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < provider.categories.length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                  height: 40,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 211, 203, 203)),
                                  child: Center(
                                    child: Text(
                                      provider.categories[i].CategoryPname,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
