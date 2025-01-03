class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String lotNumber;
  final DateTime expiryDate;
  final DateTime purchaseDate;
  final String invoiceNumber;
  final String warehouseLocation;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.lotNumber,
    required this.expiryDate,
    required this.purchaseDate,
    required this.invoiceNumber,
    required this.warehouseLocation,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      lotNumber: json['lotNumber'],
      expiryDate: DateTime.parse(json['expiryDate']),
      purchaseDate: DateTime.parse(json['purchaseDate']),
      invoiceNumber: json['invoiceNumber'],
      warehouseLocation: json['warehouseLocation'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'lotNumber': lotNumber,
      'expiryDate': expiryDate.toIso8601String(),
      'purchaseDate': purchaseDate.toIso8601String(),
      'invoiceNumber': invoiceNumber,
      'warehouseLocation': warehouseLocation,
      'quantity': quantity,
    };
  }
}