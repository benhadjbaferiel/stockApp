class InvoiceItem {
  final int qty;
  final double itemPrice;
  final String name;
  final DateTime dateTimeItem;
  InvoiceItem({
    required this.dateTimeItem,
    required this.itemPrice,
    required this.name,
    required this.qty,
  });
}
