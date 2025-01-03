import 'package:flutter/material.dart';
import 'package:inventory_app/models/product.dart';
import 'package:intl/intl.dart';

class ProductSearchItem extends StatelessWidget {
  final Product product;

  const ProductSearchItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Lot Number:', product.lotNumber),
            _buildInfoRow('Location:', product.warehouseLocation),
            _buildInfoRow(
              'Expiry Date:',
              DateFormat('dd/MM/yyyy').format(product.expiryDate),
            ),
            _buildInfoRow('Quantity:', product.quantity.toString()),
            _buildInfoRow('Invoice:', product.invoiceNumber),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}