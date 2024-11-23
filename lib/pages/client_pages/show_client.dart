import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Models/client_model.dart';
import 'package:stock_dz_app/pages/ventess/ventes.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import 'package:stock_dz_app/widgets.dart/custom_text_field.dart';
import 'package:stock_dz_app/widgets.dart/drop_Down_Button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:stock_dz_app/Services/google_map.dart';

class ShowClient extends StatefulWidget {
  ShowClient({super.key});

  @override
  State<ShowClient> createState() => _ShowClientState();
}

class _ShowClientState extends State<ShowClient> {
  final TextEditingController categorieController = TextEditingController();
  String? selectedCategory1;
  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void initState() {
    super.initState();
    // Load the suppliers only once
    Provider.of<ClientProvider>(context, listen: false).loadCategories();
    Provider.of<ClientProvider>(context, listen: false).loadclients();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, clientProvider, child) {
        return DefaultTabController(
          length: clientProvider.categories.length,
          child: Scaffold(
              appBar: AppBar(
                title: const Text("عرض العملاء"),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 228, 225, 168),
                actions: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return AlertDialog(
                                    content: const Text(
                                      'احذف تصنيف جديد للموردين',
                                      style: TextStyle(fontSize: 21),
                                    ),
                                    actions: [
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200]),
                                        child: dropDownButton(
                                          selectedValue: selectedCategory1,
                                          labelText:
                                              '                                               التصنيف',
                                          items: Provider.of<ClientProvider>(
                                                  context)
                                              .categories,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedCategory1 = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            child: const Text("تراجع"),
                                            onPressed: () async {
                                              clientProvider
                                                  .loadclients();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          const SizedBox(width: 30),
                                          TextButton(
                                            child: const Text("متابعة"),
                                            onPressed: () async {
                                              if (selectedCategory1 != null &&
                                                  selectedCategory1 != '---') {
                                                print(
                                                    'Attempting to delete category: $selectedCategory1');

                                                await clientProvider
                                                    .deleteClientsbyCategory(
                                                        selectedCategory1!);
                                                await clientProvider
                                                    .deleteCategory(
                                                        selectedCategory1!);

                                                clientProvider
                                                    .loadclients();

                                                categorieController.clear();
                                                Navigator.of(context).pop();
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  'اضف تصنيف جديد للعملاء',
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
                                        child: Text("تراجع"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      SizedBox(width: 30),
                                      TextButton(
                                        child: Text("متابعة"),
                                        onPressed: () {
                                          if (categorieController
                                              .text.isNotEmpty) {
                                            clientProvider.addCategory(
                                                categorieController.text);

                                            categorieController.clear();
                                            Navigator.of(context).pop();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('الرجاء إدخال تصنيف'),
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
                        icon: Icon(Icons.playlist_add_rounded),
                      ),
                    ],
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: clientProvider.categories
                      .map((category) => Tab(text: category))
                      .toList(),
                ),
              ),
              body: TabBarView(
                children: clientProvider.categories.map((category) {
                  return FutureBuilder<List<Clientt>>(
                    future: clientProvider.getclientsByCategory1(category),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              'حدث خطأ أثناء تحميل العملاء: ${snapshot.error}'),
                        );
                      }
                      final clients = snapshot.data ?? [];
                      if (clients.isEmpty) {
                        return const Center(
                          child: Text('لا يوجد عملاء في هذه الفئة'),
                        );
                      }
                      return ListView(
                        children: clients
                            .map(
                              (client) => ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Text(
                                      client.name[0]
                                          .toUpperCase(), // Display the initial
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                title: GestureDetector(
                                  child: Text(
                                    client.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Ventes(
                                          label: 'المبيعات',
                                        ),
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
                                                'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(client.address)}';
                                            await Mapping().openMapWithAddress(
                                                client.address);
                                          },
                                        ),
                                        Text(
                                          client.address,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _showDeleteConfirmation(
                                        context, clientProvider, client);
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  );
                }).toList(),
              )),
        );
      },
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    ClientProvider clientProvider,
    Clientt client,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من أنك تريد حذف ${client.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () async {
                await clientProvider.deleteclient(client.name);
                Navigator.of(context).pop();
              },
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );
  }
}
