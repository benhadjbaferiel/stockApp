import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:stock_dz_app/Services/constant.dart';
import 'package:stock_dz_app/invoice_achat/invoice.dart';

Future<File> generatePDF(Invoice invoice) async {
  final pdf = Document();
  /*pdf.addPage(MultiPage(
      build: (context) => [
            buildHeader(invoice),
            buildTotal(invoice),
            buildInvoice(invoice),
          ]));*/
  return await savePdf("Invoice Pdf.pdf", pdf);
}

// function to save the pdf
Future<File> savePdf(String fileName, Document pdf) async {
  final bytes = await pdf.save();
  final directory = await getApplicationCacheDirectory();
  final file = File('${directory.path}/$fileName');
  file.writeAsBytes(bytes);
  return file;
}

// function to open the pdf
Future openPDF(File file) async {
  final url = file.path;
  await OpenFile.open(url);
}
