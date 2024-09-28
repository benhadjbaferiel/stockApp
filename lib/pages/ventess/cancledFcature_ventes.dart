import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/achatss/show_Facture%20_Achats.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';

import '../../providers/invoiceModelProvider.dart';

class CancelFactureVente extends StatefulWidget {
  CancelFactureVente({super.key});

  @override
  State<CancelFactureVente> createState() => _CancelFactureVenteState();
}

class _CancelFactureVenteState extends State<CancelFactureVente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الفواتير التي تم الغاءها"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 176, 171, 86),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Row(
            children: [
              SizedBox(width: 10),
              CustomDate(),
              SizedBox(width: 10),
              Text("الى", style: TextStyle(fontSize: 21)),
              SizedBox(width: 2),
              CustomDate(),
              SizedBox(width: 8),
              Text("من", style: TextStyle(fontSize: 21)),
            ],
          ),
          Consumer<InvoiceProvider>(
            builder: (context, invoiceProvider, child) {
              if (invoiceProvider.canceledInvoicesventes.isEmpty) {
                return Center(child: Text('No invoices yet'));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: invoiceProvider.canceledInvoicesventes.length,
                itemBuilder: (context, index) {
                  final invoice = invoiceProvider.canceledInvoicesventes[index];
                  return ListTile(
                    title: Text(invoice.supplierName.isNotEmpty
                        ? invoice.supplierName
                        : 'Unknown Supplier'),
                    subtitle: Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(invoice.date)),
                    trailing: Text('${invoice.total.toStringAsFixed(2)} DZD'),
                  );
                },
              );
            },
          ),
        ])));
  }
}
