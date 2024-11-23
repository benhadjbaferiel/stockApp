import 'package:flutter/material.dart';
import '/widgets.dart/Custom_Date.dart';
import '/widgets.dart/Text_Field_add8product.dart';
import 'dart:io';
import '/Models/product_model.dart';
import '../../providers/Product_Provider.dart';
import 'package:provider/provider.dart';
import '/widgets.dart/Build_price.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/category_provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _prix1Controller = TextEditingController();
  final TextEditingController _prix2Controller = TextEditingController();
  final TextEditingController _prix3Controller = TextEditingController();
  final TextEditingController _prix4Controller = TextEditingController();
  final TextEditingController _prixAchatController = TextEditingController();
  final TextEditingController _cartonNumberController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _notifyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedCategory;
  // Function to save the product
  Future<void> _saveProduct(BuildContext context) async {
    if (_numberController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _prix1Controller.text.isEmpty ||
        _prix2Controller.text.isEmpty ||
        _prix3Controller.text.isEmpty ||
        _prix4Controller.text.isEmpty ||
        _prixAchatController.text.isEmpty ||
        _quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول المطلوبة'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final int number = int.tryParse(_numberController.text) ?? 0;
    final String name = _nameController.text;
    final double prix1 = double.tryParse(_prix1Controller.text) ?? 0;
    final double prix2 = double.tryParse(_prix2Controller.text) ?? 0;
    final double prix3 = double.tryParse(_prix3Controller.text) ?? 0;
    final double prix4 = double.tryParse(_prix4Controller.text) ?? 0;
    final double prixAchat = double.tryParse(_prixAchatController.text) ?? 0;
    final int carton = int.tryParse(_cartonNumberController.text) ?? 0;
    final int quantity = int.tryParse(_quantityController.text) ?? 0;
    final int notify = int.tryParse(_notifyController.text) ?? 0;
    final String description = _descriptionController.text;
    final DateTime date = _selectedDate ?? DateTime.now();
    int? idP = await Provider.of<ProductProvider>(context, listen: false)
        .getCategoryId(_selectedCategory!);

    final Product product = Product(
      id: 1,
      number: number,
      name: name,
      prix1: prix1,
      prix2: prix2,
      prix3: prix3,
      prix4: prix4,
      prixAchat: prixAchat,
      carton: carton,
      quantity: quantity,
      category: _selectedCategory ?? "Uncategorized",
      notify: notify,
      description: description,
      date: date,
      image: image,
      idP: idP,
    );

    Provider.of<ProductProvider>(context, listen: false)
        .addProductToDb(product);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت اضافة المنتج بنجاح')),
    );

    // Clear the fields
    _numberController.clear();
    _nameController.clear();
    _prix1Controller.clear();
    _prix2Controller.clear();
    _prix3Controller.clear();
    _prix4Controller.clear();
    _prixAchatController.clear();
    _cartonNumberController.clear();
    _quantityController.clear();
    _notifyController.clear();
    _descriptionController.clear();
    setState(() {
      image = null;
      _selectedDate = null;
      _selectedCategory = null; // Reset to default category if needed
    });
  }

  File? image;
  final imagePicker = ImagePicker();

  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة منتج جديد'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 225, 168),
        actions: [
          IconButton(
            onPressed: () {
              _saveProduct(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CustoM_TextField8AddProduct(
              label: 'رقم المنتج',
              controller: _numberController,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'اسم المنتج',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _nameController,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPrice(label: 'سعر البيع 1', controller: _prix1Controller),
                buildPrice(label: 'سعر البيع 2', controller: _prix2Controller),
                buildPrice(label: 'سعر البيع 3', controller: _prix3Controller),
                buildPrice(label: 'سعر البيع 4', controller: _prix4Controller),
              ],
            ),
            const SizedBox(height: 10),
            CustoM_TextField8AddProduct(
              label: 'سعر الشراء',
              controller: _prixAchatController,
            ),
            const SizedBox(height: 10),
            CustoM_TextField8AddProduct(
              label: "الكرطونة",
              controller: _cartonNumberController,
            ),
            const SizedBox(height: 10),
            CustoM_TextField8AddProduct(
              label: "الكمية",
              controller: _quantityController,
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  const Text("التصنيف", style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  Consumer<CategoryProvider>(
                    builder: (context, categoryProvider, child) {
                      final categories = categoryProvider.categories;

                      if (categories.isEmpty) {
                        return const Text("لا توجد تصنيفات");
                      }

                      // Set initial value if not set or invalid
                      if (_selectedCategory == null ||
                          !categories.any(
                              (c) => c.CategoryPname == _selectedCategory)) {
                        _selectedCategory = categories[0].CategoryPname;
                      }

                      return DropdownButton<String>(
                        value: _selectedCategory,
                        items: categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category.CategoryPname,
                            child: Text(category.CategoryPname),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustoM_TextField8AddProduct(
              label: "حد الطلب(انذار عندما يصل المنتج الى الكمية)",
              controller: _notifyController,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "الوصف",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _nameController,
            ),
            const SizedBox(height: 10),
            const Text("تاريخ الانتهاء", style: TextStyle(fontSize: 25)),
            CustomDate(),
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                IconButton(
                    onPressed: () {
                      uploadImage();
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                    )),
              ],
            ),
            image != null
                ? Image.file(
                    image!,
                    height: 100,
                    width: 100,
                  )
                : Text(
                    "اضف صورة المنتج",
                    style: TextStyle(fontSize: 20),
                  )
          ],
        ),
      ),
    );
  }
}
