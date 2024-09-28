import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/Vente_Retour/vente_retour.dart';
import 'package:stock_dz_app/providers/client_provider.dart';
import 'package:stock_dz_app/widgets.dart/custom_text_field.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:stock_dz_app/Services/google_map.dart';

class ShowClientRetour extends StatelessWidget {
  ShowClientRetour({super.key});

  final TextEditingController categorieController = TextEditingController();
  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
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
              backgroundColor: const Color.fromARGB(255, 176, 171, 86),
              actions: [
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
                                    if (categorieController.text.isNotEmpty) {
                                      clientProvider.addCategory(
                                          categorieController.text);

                                      categorieController.clear();
                                      Navigator.of(context).pop();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
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
                  icon: Icon(Icons.playlist_add_rounded),
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
              children: clientProvider.categories
                  .map((category) => ListView(
                        children: clientProvider
                            .getClientsByCategory(category)
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
                                      client.name,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                title: GestureDetector(
                                  child: Text(
                                    client.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VenteRetour(
                                          label: "شاشة المرتجعات-المبيعات",
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
                                          icon: Icon(
                                            Icons.location_on,
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            // Use Mapping class to open the location on the map
                                            final String googleURL =
                                                'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(client.address)}';
                                            await Mapping().openMapWithAddress(
                                                client
                                                    .address); // Use appropriate coordinates or URL
                                          },
                                        ),
                                        Text(
                                          client.address,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [],
                                ),
                              ),
                            )
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
