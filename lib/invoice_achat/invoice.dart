import 'package:stock_dz_app/Models/product_model.dart';
import 'package:stock_dz_app/invoice_achat/invoiceItem.dart';
import 'package:stock_dz_app/invoice_achat/invoice_info.dart';

class Invoice {
  final List<InvoiceItem> invoiceitem;
  final InvoiceInfo invoiceinfo;
  final Product product;

  Invoice({
    required this.invoiceitem,
    required this.invoiceinfo,
    required this.product,
  });
}
