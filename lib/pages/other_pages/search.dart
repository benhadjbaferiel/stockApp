import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/Models/client_model.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/Models/invoice/invoice.dart';
import 'package:stock_dz_app/Models/invoice/invoice_info.dart';
import 'package:stock_dz_app/Models/invoice/invoice_items.dart';
import 'package:stock_dz_app/pages/other_pages/pdf.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final _searchController = TextEditingController();
  List<Fournisseure> _filteredFournisseures = [];
  @override
  void initState() {
    super.initState();
    _filteredFournisseures =
        Provider.of<FournisseureProvider>(context, listen: false)
            .getFournisseures;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Text('ادخل اسم المورد'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'البحث عن مورد',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (query) {
                  setState(() {
                    _filteredFournisseures = Provider.of<FournisseureProvider>(
                            context,
                            listen: false)
                        .getFournisseures
                        .where((fournisseur) => fournisseur.nameF
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80, // Set a specific height for the list0
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredFournisseures.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () async {
                          //i have to handle the generation of the provider
                          final invoice = Invoice(
                              client: Clientt(
                                name: "jj",
                                Barcode: 25445,
                                address: 'fvds',
                                phoneNumber: 578,
                                Price: 444,
                                NIF: 44,
                                NIS: 47,
                                MAX: 47,
                                DAYS: 47,
                                categorie: 'hfh',
                                AI: 54,
                                RC: 78,
                              ),
                              fournisseure: Fournisseure(
                                  nameF: 'nameF',
                                  addressF: 'addressF',
                                  phoneNumberF: 658888,
                                  NIFF: 8,
                                  AIF: 8,
                                  RCF: 7,
                                  NISF: 7,
                                  categorie1: 'rrr'),
                              invoiceinfo: InvoiceInfo(
                                  dexc: 'dexc',
                                  dueDate:
                                      DateTime.now().add(Duration(days: 7)),
                                  invoiceDate: DateTime.now(),
                                  invoiceNumber: 0),
                              invoiceitems: [
                                Invoiceitems(
                                  itemPrice: 584,
                                  vat: 78,
                                  dateTimeItem: DateTime.now(),
                                  qty: 200,
                                  itemName: 'itemName',
                                ),
                                Invoiceitems(
                                  itemPrice: 584,
                                  vat: 78,
                                  dateTimeItem: DateTime.now(),
                                  qty: 200,
                                  itemName: 'itemName',
                                ),
                              ]);
                          final pdfFile = await generatePdf(invoice);
                          openPdf(pdfFile);
                        },
                        child: ListTile(
                          title: Text(_filteredFournisseures[index].nameF),
                        ));
                  },
                ),
              ),
            ],
          ),
          actions: [
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
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
