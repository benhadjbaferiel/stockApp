import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/achatss/Achats.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';
import 'package:stock_dz_app/widgets.dart/custom_text_field.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:stock_dz_app/Services/google_map.dart';

class ShowFournisseure extends StatefulWidget {
  ShowFournisseure({super.key});

  @override
  State<ShowFournisseure> createState() => _ShowFournisseureState();
}

class _ShowFournisseureState extends State<ShowFournisseure> {
  final TextEditingController categorieController = TextEditingController();

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    // Load the suppliers only once
    Provider.of<FournisseureProvider>(context, listen: false)
        .loadFournisseurs();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FournisseureProvider>(
      builder: (context, fournisseurProvider, child) {
        return DefaultTabController(
          length: fournisseurProvider.categories1.length,
          child: Scaffold(
              appBar: AppBar(
                title: const Text("عرض الموردين"),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 228, 225, 168),
                actions: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              'اضف تصنيف جديد للموردين',
                              style: TextStyle(fontSize: 21),
                            ),
                            actions: [
                              Container(
                                height: 40,
                                width: 350,
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                child: customtextfield(
                                  label: 'اضف تصنيف',
                                  icon: Icons.save_as,
                                  controller: categorieController,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: const Text("تراجع"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(width: 30),
                                  TextButton(
                                    child: const Text("متابعة"),
                                    onPressed: () {
                                      if (categorieController.text.isNotEmpty) {
                                        fournisseurProvider.addCategory(
                                            categorieController.text);

                                        categorieController.clear();
                                        Navigator.of(context).pop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('الرجاء إدخال تصنيف'),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.playlist_add_rounded),
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: fournisseurProvider.categories1
                      .map((category) => Tab(text: category))
                      .toList(),
                ),
              ),
              body: TabBarView(
                children: fournisseurProvider.categories1.map((category) {
                  // Load the suppliers for the selected category
                  final fournisseurs =
                      fournisseurProvider.getFournisseureByCategory(category);

                  // Check if there are no suppliers
                  if (fournisseurs.isEmpty) {
                    return Center(child: Text('لا يوجد موردين في هذه الفئة'));
                  }

                  return ListView(
                    children: fournisseurs
                        .map(
                          (fournisseur) => ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Text(
                                  fournisseur.nameF,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            title: GestureDetector(
                              child: Text(
                                fournisseur.nameF,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                ),
                              ),
                              onTap: () {
                                // Navigate to FournisseurDetails page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Achats(),
                                  ),
                                );
                              },
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.location_on,
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        final String googleURL =
                                            'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(fournisseur.addressF)}';
                                        await Mapping().openMapWithAddress(
                                            fournisseur.addressF);
                                      },
                                    ),
                                    Text(
                                      fournisseur.addressF,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  );
                }).toList(),
              )),
        );
      },
    );
  }
}
