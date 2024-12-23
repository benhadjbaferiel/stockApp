class InvoiceItem {
  final int qty;
  final double itemPrice;
  final String name;
  final DateTime dateTimeItem;
  final double vat; // Add this if it's missing

  InvoiceItem({
    required this.dateTimeItem,
    required this.itemPrice,
    required this.name,
    required this.qty,
    required this.vat,
  });
}
