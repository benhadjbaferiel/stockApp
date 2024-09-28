import 'package:flutter/foundation.dart';

class Invoice {
  final String id;
  final String supplierName;
  final double total;
  final double paid;
  final String paymentMethod;
  final double tax;
  final double discount;
  final String note;
  final DateTime date;
  bool isCanceled;

  Invoice({
    required this.id,
    required this.supplierName,
    required this.total,
    required this.paid,
    required this.paymentMethod,
    required this.tax,
    required this.discount,
    required this.note,
    required this.date,
    this.isCanceled = false,
  });
}

class InvoiceProvider with ChangeNotifier {
  List<Invoice> _invoices = [];
  List<Invoice> _canceledInvoices = [];

  List<Invoice> _invoicesventes = [];
  List<Invoice> _canceledInvoicesventes = [];

  List<Invoice> _invoicesretourVente = [];
  List<Invoice> _canceledInvoicesRVente = [];

  List<Invoice> _invoicesRachat = [];
  List<Invoice> _canceledInvoicesRachat = [];

  List<Invoice> _invoicesFacture = [];
  List<Invoice> _canceledInvoicesfacture = [];

  List<Invoice> get invoices => _invoices;
  List<Invoice> get canceledInvoices => _canceledInvoices;

  List<Invoice> get invoicesventes => _invoicesventes;
  List<Invoice> get canceledInvoicesventes => _canceledInvoicesventes;

  List<Invoice> get invoicesretourVente => _invoicesretourVente;
  List<Invoice> get canceledInvoicesRVente => _canceledInvoicesRVente;

  List<Invoice> get invoicesRachat => _invoicesRachat;
  List<Invoice> get canceledInvoicesRachat => _canceledInvoicesRachat;

  List<Invoice> get invoicesFacture => _invoicesFacture;
  List<Invoice> get canceledInvoicesfacture => _canceledInvoicesfacture;

  void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
    notifyListeners();
  }

  void addInvoiceCancled(Invoice invoice) {
    _canceledInvoices.add(invoice);
    notifyListeners();
  }

  void addInvoiceV(Invoice invoice) {
    _invoicesventes.add(invoice);
    notifyListeners();
  }

  void addInvoiceCancledV(Invoice invoice) {
    _canceledInvoicesventes.add(invoice);
    notifyListeners();
  }

  void addInvoiceAR(Invoice invoice) {
    _invoicesRachat.add(invoice);
    notifyListeners();
  }

  void addInvoiceCancledAR(Invoice invoice) {
    _canceledInvoicesRachat.add(invoice);
    notifyListeners();
  }

  void addInvoiceVR(Invoice invoice) {
    _invoicesretourVente.add(invoice);
    notifyListeners();
  }

  void addInvoiceCancledVR(Invoice invoice) {
    _canceledInvoicesRVente.add(invoice);
    notifyListeners();
  }

  void addInvoiceF(Invoice invoice) {
    _invoicesFacture.add(invoice);
    notifyListeners();
  }

  void addInvoiceCancledF(Invoice invoice) {
    _canceledInvoicesfacture.add(invoice);
    notifyListeners();
  }

  void cancelInvoice(Invoice invoice) {
    invoice.isCanceled = true;
    _canceledInvoices.add(invoice);
    _invoices.remove(invoice);
    notifyListeners(); // This will notify the UI to update
  }
}
