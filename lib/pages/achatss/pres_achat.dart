import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/product_model.dart';
import 'package:stock_dz_app/Services/homePageViewModel.dart';
import 'package:stock_dz_app/invoice_achat/invoice.dart';
import 'package:stock_dz_app/invoice_achat/invoiceItem.dart';
import 'package:stock_dz_app/invoice_achat/invoice_info.dart';
import 'package:stock_dz_app/pages/achatss/cancel_facture.dart';
import 'package:stock_dz_app/pages/achatss/show_Facture%20_Achats.dart';
import 'package:stock_dz_app/sql_db.dart';
import '../fournisseure_pages/show_fournisseure.dart';
import '/widgets.dart/in_Kwell_Custom.dart';

class Presachat extends StatefulWidget {
  const Presachat({Key? key}) : super(key: key);

  @override
  State<Presachat> createState() => _PresachatState();
}

class _PresachatState extends State<Presachat> {
  void showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "           تقارير المشتريات ",
            style: TextStyle(fontSize: 25),
          ),
          content: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {},
                    child: Text(
                      "   تقرير بالمشتريات  ",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final invoice = Invoice(
                          product: Product(
                              id: 1,
                              number: 545,
                              name: 'feriel',
                              prix1: 10,
                              prix2: 20,
                              prix3: 30,
                              prix4: 40,
                              prixAchat: 5,
                              carton: 100,
                              quantity: 500,
                              category: 's',
                              notify: 400,
                              description: 'him',
                              date: DateTime.now()),
                          invoiceinfo: InvoiceInfo(
                              dexc: 'hahaahha',
                              dueDate: DateTime.now(),
                              invoiceDate: DateTime.now(),
                              invoiceNumber: 1),
                          invoiceitem: InvoiceItem(
                              dateTimeItem: DateTime.now(),
                              itemPrice: 200,
                              name: 'r',
                              qty: 200));
                      final pdfFile = await generatePDF(invoice);
                      openPDF(pdfFile);
                    },
                    child: Text(
                      "   تقرير بالمشتريات حسب الصنف",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات حسب التصنيف"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("  تقرير بالمشتريات  النقد"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات  الاجل"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات  (بطاقة)"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات (شيك)"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات (الكل)"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات حسب المورد"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("تقرير بالمشتريات اكسل"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Image.asset(
                'images/5.png',
                width: 250,
                height: 150,
              ),
              InkwellF(
                label:
                    "                                                           عرض الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowFournisseure()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                  عرض فواتير الموردين",
                Icon: Icons.list,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowFactureAchats(
                              label: 'عرض فواتير الموردين',
                            )),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                          تقرير المشتريات",
                Icon: Icons.copy_sharp,
                callbackHandle: () {
                  showDialogue(context);
                },
              ),
              const SizedBox(height: 30),
              InkwellF(
                label:
                    "                                                الفواتير التي تم الغاءها",
                Icon: Icons.view_list_outlined,
                callbackHandle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CancelFacture()),
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
