import 'package:stock_dz_app/Models/client_model.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';
import 'package:stock_dz_app/Models/invoice/invoice_info.dart';
import 'package:stock_dz_app/Models/invoice/invoice_items.dart';

class Invoice {
  final Fournisseure fournisseure;
  final Clientt client;
  final InvoiceInfo invoiceinfo;
  final List<Invoiceitems> invoiceitems;

  Invoice({
    required this.client,
    required this.fournisseure,
    required this.invoiceinfo,
    required this.invoiceitems,
  });
}
