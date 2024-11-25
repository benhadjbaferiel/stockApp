import 'package:pdf/widgets.dart' as pw; // Import PDF widgets with alias `pw`
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:stock_dz_app/invoice_achat/invoice.dart';
import 'package:stock_dz_app/invoice_vente/invoice.dart';
// Your invoice model

// Building the PDF header
pw.Widget buildHeader(dynamic invoice) {
  if (invoice is Invoice) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Invoice",
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
        pw.Text("Invoice Number: ${invoice.invoiceinfo.invoiceNumber}"),
        pw.Text(
            "Invoice Date: ${DateFormat.yMMMMd().format(invoice.invoiceinfo.invoiceDate)}"),
        pw.Text(
            "Due Date: ${DateFormat.yMMMMd().format(invoice.invoiceinfo.dueDate)}"),
        pw.SizedBox(height: 1 * PdfPageFormat.cm),
      ],
    );
  } else if (invoice is InvoiceV) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Invoice V",
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
        pw.Text("Product Name: ${invoice.product.name}"),
        pw.Text(
            "Invoice Date: ${DateFormat.yMMMMd().format(invoice.invoiceinfo.invoiceDate)}"),
        pw.Text("Status: ${invoice.invoiceinfo.dexc}"),
        pw.SizedBox(height: 1 * PdfPageFormat.cm),
      ],
    );
  }
  return pw.Container(); // Fallback if type is unknown
}

// Building the PDF invoice table
pw.Widget buildInvoice(dynamic invoice) {
  final headers = ["Name", "Date", "Quantity", "Unit Price", "VAT", "Total"];
  List<List<String>> data;

  if (invoice is Invoice) {
    data = invoice.invoiceitem.map((item) {
      final totalPrice = item.itemPrice * item.qty * (1 + item.vat);
      return [
        item.name,
        DateFormat.yMd().format(item.dateTimeItem),
        item.qty.toString(),
        item.itemPrice.toStringAsFixed(2),
        "${(item.vat * 100).toStringAsFixed(0)}%",
        totalPrice.toStringAsFixed(2),
      ];
    }).toList();
  } else if (invoice is InvoiceV) {
    final item = invoice.invoiceitem;
    final totalPrice = item.itemPrice * item.qty * (1 + item.vat);
    data = [
      [
        item.name,
        DateFormat.yMd().format(item.dateTimeItem),
        item.qty.toString(),
        item.itemPrice.toStringAsFixed(2),
        "${(item.vat * 100).toStringAsFixed(0)}%",
        totalPrice.toStringAsFixed(2),
      ]
    ];
  } else {
    data = []; // Fallback for unknown types
  }

  return pw.TableHelper.fromTextArray(
    headers: headers,
    data: data,
    border: pw.TableBorder.all(width: 1, color: PdfColors.black),
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    headerDecoration: pw.BoxDecoration(color: PdfColors.grey200),
    cellHeight: 30,
    cellAlignment: pw.Alignment.centerRight,
  );
}


pw.Widget buildTotal(dynamic invoice) {
  double netTotal = 0, vat = 0, total = 0;

  if (invoice is Invoice) {
    netTotal = invoice.invoiceitem
        .map((item) => item.itemPrice * item.qty)
        .reduce((value, element) => value + element);

    vat = invoice.invoiceitem
        .map((item) => item.itemPrice * item.qty * item.vat)
        .reduce((value, element) => value + element);
  } else if (invoice is InvoiceV) {
    final item = invoice.invoiceitem;
    netTotal = item.itemPrice * item.qty;
    vat = netTotal * item.vat;
  }

  total = netTotal + vat;

  return pw.Container(
    alignment: pw.Alignment.centerRight,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        buildText(title: 'Net Total', value: netTotal.toStringAsFixed(2), unite: true),
        buildText(title: 'VAT', value: vat.toStringAsFixed(2), unite: true),
        pw.Divider(),
        buildText(
          title: 'Total Amount',
          value: total.toStringAsFixed(2),
          titleStyle: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          unite: true,
        ),
      ],
    ),
  );
}


buildText({
  required String title,
  required String value,
  double width = double.infinity,
  pw.TextStyle? titleStyle,
  bool unite = false,
}) {
  final style = titleStyle ?? pw.TextStyle(fontWeight: pw.FontWeight.bold);
  return pw.Container(
      width: width,
      child: pw.Row(children: [
        pw.Expanded(child: pw.Text(title, style: style)),
        pw.Text(value, style: unite ? style : null),
      ]));
}
