import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/pages/achatss/show_Facture%20_Achats.dart';
import 'package:stock_dz_app/providers/invoiceModelProvider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';

class ShowfactureRetourAchat extends StatefulWidget {
  final String label;
  ShowfactureRetourAchat({required this.label, super.key});

  @override
  State<ShowfactureRetourAchat> createState() => _ShowfactureRetourAchatState();
}

class _ShowfactureRetourAchatState extends State<ShowfactureRetourAchat> {
  final List<PaymentOption> _options = [
    PaymentOption(label: 'نقد', isSelected: false),
    PaymentOption(label: 'الاجل', isSelected: false),
    PaymentOption(label: 'بطاقة', isSelected: false),
    PaymentOption(label: 'شيك', isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.label),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 228, 225, 168),
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
          // Payment options row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ..._options.map((option) => _buildOptionItem(option)).toList(),
                const SizedBox(width: 16),
                const Text('بحث',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Consumer<InvoiceProvider>(
            builder: (context, invoiceProvider, child) {
              if (invoiceProvider.invoicesRachat.isEmpty) {
                return Center(child: Text('No invoices yet'));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: invoiceProvider.invoicesRachat.length,
                itemBuilder: (context, index) {
                  final invoice = invoiceProvider.invoicesRachat[index];
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

  Widget _buildOptionItem(PaymentOption option) {
    return Row(
      children: [
        Text(option.label, style: const TextStyle(fontSize: 14)),
        Checkbox(
          value: option.isSelected,
          onChanged: (bool? value) {
            setState(() {
              option.isSelected = value ?? false;
            });
          },
          activeColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

class PaymentOption {
  final String label;
  bool isSelected;

  PaymentOption({required this.label, required this.isSelected});
}
