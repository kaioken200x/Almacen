import 'package:flutter/material.dart';
import 'package:inventory_app/models/product.dart';
import 'package:intl/intl.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lot: ${product.lotNumber}'),
            Text('Location: ${product.warehouseLocation}'),
            Text('Expiry: ${DateFormat('dd/MM/yyyy').format(product.expiryDate)}'),
            Text('Quantity: ${product.quantity}'),
          ],
        ),
        trailing: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}