import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/invoiceModelProvider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';

class CancelFacture extends StatefulWidget {
  const CancelFacture({super.key});

  @override
  State<CancelFacture> createState() => _CancelFactureState();
}

class _CancelFactureState extends State<CancelFacture> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Force a rebuild when the dependencies change (e.g., when the screen is opened)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الفواتير التي تم الغاءها"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                CustomDate(), // Start date
                SizedBox(width: 10),
                Text("الى", style: TextStyle(fontSize: 21)),
                SizedBox(width: 2),
                CustomDate(), // End date
                SizedBox(width: 8),
                Text("من", style: TextStyle(fontSize: 21)),
              ],
            ),
            // List of canceled invoices
            Consumer<InvoiceProvider>(
              builder: (context, invoiceProvider, child) {
                if (invoiceProvider.canceledInvoices.isEmpty) {
                  return Center(child: Text('Aucune facture annulée'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: invoiceProvider.canceledInvoices.length,
                  itemBuilder: (context, index) {
                    final invoice = invoiceProvider.canceledInvoices[index];
                    return ListTile(
                      title: Text(invoice.supplierName.isNotEmpty
                          ? invoice.supplierName
                          : 'Fournisseur Inconnu'),
                      subtitle: Text(
                          DateFormat('yyyy-MM-dd HH:mm').format(invoice.date)),
                      trailing: Text('${invoice.total.toStringAsFixed(2)} DZD'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
