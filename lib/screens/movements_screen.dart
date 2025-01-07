import 'package:flutter/material.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _MovementItem(
            type: 'Entrada',
            product: 'Laptops',
            quantity: '50 unidades',
            date: '01/01/2024',
            isEntry: true,
          ),
          _MovementItem(
            type: 'Salida',
            product: 'Monitores',
            quantity: '20 unidades',
            date: '31/12/2023',
            isEntry: false,
          ),
          _MovementItem(
            type: 'Entrada',
            product: 'Teclados',
            quantity: '100 unidades',
            date: '30/12/2023',
            isEntry: true,
          ),
          _MovementItem(
            type: 'Salida',
            product: 'Mouse',
            quantity: '30 unidades',
            date: '29/12/2023',
            isEntry: false,
          ),
        ],
      ),
    );
  }
}

class _MovementItem extends StatelessWidget {
  final String type;
  final String product;
  final String quantity;
  final String date;
  final bool isEntry;

  const _MovementItem({
    required this.type,
    required this.product,
    required this.quantity,
    required this.date,
    required this.isEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          isEntry ? Icons.arrow_forward : Icons.arrow_back,
          color: isEntry ? Colors.green : Colors.red,
        ),
        title: Text(product),
        subtitle: Text('$type - $quantity'),
        trailing: Text(date),
      ),
    );
  }
}