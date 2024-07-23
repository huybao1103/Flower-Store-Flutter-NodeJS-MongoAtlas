class Invoice {
  final String id;
  final String detailInvoiceId;
  final String accountId;

  Invoice({
    required this.id,
    required this.detailInvoiceId,
    required this.accountId,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['_id'],
      detailInvoiceId: json['detailinvoiceId'],
      accountId: json['accountId'],
    );
  }
}
