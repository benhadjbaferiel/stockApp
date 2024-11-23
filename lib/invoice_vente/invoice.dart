import 'package:stock_dz_app/Models/product_model.dart';
import 'package:stock_dz_app/invoice_achat/invoiceItem.dart';
import 'package:stock_dz_app/invoice_achat/invoice_info.dart';

class InvoiceV {
  final Product product;
  final InvoiceInfo invoiceinfo;
  final InvoiceItem invoiceitem;
  InvoiceV({
    required this.product,
    required this.invoiceinfo,
    required this.invoiceitem,
  });
}
