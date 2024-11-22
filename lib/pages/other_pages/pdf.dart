import 'package:open_document/my_files/init.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:stock_dz_app/Models/invoice/invoice.dart';
import 'package:stock_dz_app/Services/constant.dart';

Future<File> generatePdf(Invoice invoice) async {
  final pdf = Document();
  pdf.addPage(MultiPage(
      build: (context) => [
            buildHeader(invoice),
            buildInvoice(invoice),
            buildTotal(invoice),
          ]));
  return await savedPdf("feriel.pdf", pdf);
}

Future<File> savedPdf(String fileName, Document pdf) async {
  final bytes = await pdf.save();
  final Directory = await getApplicationCacheDirectory();
  final file = File('${Directory.path}/$fileName');
  file.writeAsBytes(bytes);
  return file;
}

Future openPdf(File file) async {
  final url = file.path;
  await OpenFile.open(url);
}
