class Invoiceitems {
  final int qty;
  final DateTime dateTimeItem;
  final double vat;
  final double itemPrice;
  final String itemName;

  Invoiceitems({
    required this.itemPrice,
    required this.vat,
    required this.dateTimeItem,
    required this.qty,
    required this.itemName,
  });
}
