import 'package:open_document/my_files/init.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw; // Import PDF widgets with alias `pw`
import 'package:stock_dz_app/Models/invoice/invoice.dart';
import 'package:stock_dz_app/Services/constant.dart';

Future<File> generatePDF(Invoice invoice) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        buildHeader(invoice),
        buildInvoice(invoice),
        buildTotal(invoice),
      ],
    ),
  );

  return await savePdf("invoice.pdf", pdf);
}

Future<File> savePdf(String fileName, pw.Document pdf) async {
  try {
    final bytes = await pdf.save();
    final directory = await getApplicationCacheDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes);
    return file;
  } catch (e) {
    print('Error saving PDF: $e');
    throw Exception('Failed to save PDF file');
  }
}

Future<void> openPDF(File file) async {
  try {
    final url = file.path;
    final result = await OpenFile.open(url);
    if (result.type != ResultType.done) {
      throw Exception('Failed to open PDF: ${result.message}');
    }
  } catch (e) {
    print('Error opening PDF: $e');
    throw Exception('Failed to open PDF file');
  }
}
