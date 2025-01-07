import 'package:flutter/material.dart';

class LowStockScreen extends StatelessWidget {
  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Bajo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _LowStockItem(
            product: 'Teclados',
            currentStock: 5,
            minStock: 10,
            criticalLevel: true,
          ),
          _LowStockItem(
            product: 'Ratones',
            currentStock: 8,
            minStock: 15,
            criticalLevel: false,
          ),
          _LowStockItem(
            product: 'Monitores',
            currentStock: 12,
            minStock: 20,
            criticalLevel: false,
          ),
        ],
      ),
    );
  }
}

class _LowStockItem extends StatelessWidget {
  final String product;
  final int currentStock;
  final int minStock;
  final bool criticalLevel;

  const _LowStockItem({
    required this.product,
    required this.currentStock,
    required this.minStock,
    required this.criticalLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.warning,
          color: criticalLevel ? Colors.red : Colors.orange,
        ),
        title: Text(product),
        subtitle: Text('$currentStock unidades (Mínimo: $minStock)'),
        trailing: TextButton(
          onPressed: () {
            // TODO: Implement reorder functionality
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(103, 140, 231, 171),
            elevation: 5,
          ),
          child: const Text('Hacer Pedido'),
        ),
      ),
    );
  }
}
