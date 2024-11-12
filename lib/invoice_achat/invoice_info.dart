class InvoiceInfo {
  final int invoiceNumber;
  final DateTime invoiceDate;
  final DateTime dueDate;
  final String dexc;
  InvoiceInfo({
    required this.dexc,
    required this.dueDate,
    required this.invoiceDate,
    required this.invoiceNumber,
  });
}
