class DetailInvoice {
  final String id;
  final List<String> productId;
  final int quantity;
  final double price;
  final String address;
  final String date;

  DetailInvoice({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.address,
    required this.date,
  });

  factory DetailInvoice.fromJson(Map<String, dynamic> json) {
    return DetailInvoice(
      id: json['_id'],
      productId: List<String>.from(json['productId']),
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      address: json['address'],
      date: json['date'],
    );
  }
}
