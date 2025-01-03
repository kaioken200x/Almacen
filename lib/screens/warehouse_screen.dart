import 'package:flutter/material.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Almacén'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _WarehouseCard(
            title: 'Zona A',
            capacity: '80%',
            items: 150,
            onTap: () {},
          ),
          _WarehouseCard(
            title: 'Zona B',
            capacity: '45%',
            items: 89,
            onTap: () {},
          ),
          _WarehouseCard(
            title: 'Zona C',
            capacity: '95%',
            items: 200,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _WarehouseCard extends StatelessWidget {
  final String title;
  final String capacity;
  final int items;
  final VoidCallback onTap;

  const _WarehouseCard({
    required this.title,
    required this.capacity,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Capacidad: $capacity'),
            Text('Artículos: $items'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}