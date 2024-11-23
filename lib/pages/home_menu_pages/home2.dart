import 'package:flutter/material.dart';
import '../achatssRetour/Pres_Retour_Achat.dart';
import '/pages/other_pages/impot_Home_Page.dart';
import '../inventaire_pages/inventaire.dart';
import '../stock_user_pages/user_Stock.dart';
import 'help.dart';
import '../Vente_Retour/pres_Vente_Retour.dart';
import 'impots.dart';
import 'imprimante.dart';
import 'settings.dart';
import '../caisse_pages/caisse.dart';
import '../client_pages/clients.dart';
import '../fournisseure_pages/fournisseure.dart';
import '../depances_pages/depences.dart';
import '../other_pages/requet.dart';
import '../ventess/pres_Ventes.dart';
import '../achatss/pres_achat.dart';

class home2 extends StatefulWidget {
  home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 225, 168),
        title: const Text("ModirPos"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 225, 168),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('                 طباعة المحاسب اليومي'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('   طباعة المحاسب اليومي بالمخزون'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text(
                'طباعة  تقرير  راس المال',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: const Text(
                'إعدادات النظام',
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'الإعدادات',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text(
                'الطابعه',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Imprimante()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.money_off),
              title: const Text(
                'الضرائب',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaxPage()),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: const Text(
                'المساعدة',
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'المساعدة',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Help()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.system_update),
              title: const Text(
                'تحديث البرنامج ',
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home2()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text(
                'تسجيل الخروج',
                textAlign: TextAlign.end,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          child: Center(
            child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: List.generate(12, (index) {
                // Define the icon paths and titles
                final icons = [
                  'icons/11.png',
                  'icons/10.png',
                  'icons/111.png',
                  'icons/222.png',
                  'icons/12.png',
                  'icons/15.png',
                  'icons/13.png',
                  'icons/14.png',
                  'icons/16.png',
                  'icons/8.png',
                  'icons/000.png',
                  'icons/145.png'
                ];
                final titles = [
                  'المشتريات',
                  'المبيعات',
                  ' المشتريات-ارجاع ',
                  ' المبيعات-ارجاع',
                  'الموردين',
                  'العملاء',
                  'المصروفات',
                  'الصندوق',
                  'الاستعلامات',
                  'المخزون',
                  '  المسخدمين',
                  'الفواتير الضريبية'
                ];

                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Presachat()));
                        break;
                      case 1:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PresVentes()));
                        break;

                      case 2:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PresRetourAchat()));
                        break;
                      case 3:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PresVenteRetour()));
                        break;
                      case 4:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FournisseurScreen()));
                        break;
                      case 5:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Clients()));
                        break;
                      case 6:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Depences()));
                        break;
                      case 7:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Caisse()));
                        break;
                      case 8:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Requet()));
                        break;
                      case 9:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Inventaire()));
                        break;
                      case 10:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserStock()));
                        break;
                      case 11:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ImpotHomePage()));
                        break;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 231, 241, 247)),
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icons[index],
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          titles[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
