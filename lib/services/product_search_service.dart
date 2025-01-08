import 'package:globomatik_app/models/product.dart';

class ProductSearchService {
  // Mock product data
  static final List<Product> _mockProducts = [
    Product(
      id: '1',
      name: 'Laptop XPS 13',
      description: 'High-end laptop with 16GB RAM',
      price: 1299.99,
      lotNumber: 'LOT123',
      expiryDate: DateTime.now().add(const Duration(days: 365)),
      purchaseDate: DateTime.now().subtract(const Duration(days: 30)),
      invoiceNumber: 'INV001',
      warehouseLocation: 'A1-B2',
      quantity: 50,
    ),
    Product(
      id: '2',
      name: 'Wireless Mouse',
      description: 'Ergonomic wireless mouse',
      price: 29.99,
      lotNumber: 'LOT456',
      expiryDate: DateTime.now().add(const Duration(days: 730)),
      purchaseDate: DateTime.now().subtract(const Duration(days: 15)),
      invoiceNumber: 'INV002',
      warehouseLocation: 'A1-B3',
      quantity: 200,
    ),
    // Add more mock products as needed
  ];

  // Mock search function - Replace with actual API integration
  static Future<List<Product>> searchProducts(String query) async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock search logic
    if (query.isEmpty) return _mockProducts;

    return _mockProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.lotNumber.toLowerCase().contains(query.toLowerCase());
    }).toList();

    /* 
    // TODO: Implement actual API integration
    try {
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/products/search?q=$query'),
        headers: {
          'Authorization': 'Bearer $token', // Add your authentication token
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search products');
      }
    } catch (e) {
      throw Exception('Search failed: $e');
    }
    */
  }
}
