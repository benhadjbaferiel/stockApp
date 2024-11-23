import 'package:pdf/widgets.dart' as pw; // Import PDF widgets with alias `pw`
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:stock_dz_app/Models/invoice/invoice.dart'; // Your invoice model

// Building the PDF header
pw.Widget buildHeader(Invoice invoice) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text("Invoice Header"),
        pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
        pw.Text("Details"),
      ],
    );

// Building the PDF invoice table
pw.Widget buildInvoice(Invoice invoice) {
  final headers = ["Name", "Date", "Quantity", "Unit Price", "VAT", "Total"];
  final data = [
    ["Item 1", "01/01/2024", "10", "5.00", "0.2", "60.00"],
    ["Item 2", "02/01/2024", "20", "2.50", "0.1", "55.00"],
  ];
  // Map data for the table
  final data1 = invoice.invoiceitems.map((e) {
    final totalPrice = e.itemPrice * e.qty * (1 + e.vat);
    return [
      e.itemName,
      DateFormat.yMd().format(e.dateTimeItem),
      e.qty.toString(),
      e.itemPrice.toString(),
      e.vat.toString(),
      totalPrice.toString(),
    ];
  }).toList();
  if (invoice.invoiceitems.isEmpty) {
    throw Exception("Invoice items list is empty.");
  }
  if (invoice.invoiceitems.any((item) => item.vat < 0 || item.vat > 1)) {
    throw Exception("Invalid VAT percentage found in invoice items.");
  }

  // Return PDF table widget
  return pw.Table.fromTextArray(
    headers: headers,
    data: data,
    border: pw.TableBorder.all(width: 1, color: PdfColors.black),
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    headerDecoration: pw.BoxDecoration(color: PdfColors.grey200),
    cellHeight: 30,
    cellAlignment: pw.Alignment.centerRight,
  );
}

pw.Widget buildTotal(Invoice invoice) {
  final netTotal = invoice.invoiceitems
      .map((item) => item.itemPrice * item.qty)
      .reduce((item1, item2) => item1 + item2);
  final vatpercentage = invoice.invoiceitems.first.vat;
  final vat = netTotal * vatpercentage;
  final total = netTotal + vat;
  return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Row(children: [
        pw.Spacer(flex: 6),
        pw.Expanded(
            flex: 4,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'total',
                  value: netTotal.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Vat${vatpercentage * 100}%',
                  value: vatpercentage.toString(),
                  unite: true,
                ),
                pw.Divider(),
                buildText(
                  title: 'total amount ',
                  titleStyle: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  value: total.toString(),
                  unite: true,
                ),
                pw.SizedBox(height: 2 * PdfPageFormat.mm),
                pw.Container(height: 1, color: PdfColors.grey400),
                pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                pw.Container(height: 1, color: PdfColors.grey400),
              ],
            ))
      ]));
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
