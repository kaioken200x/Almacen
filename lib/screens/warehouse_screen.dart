import 'package:flutter/material.dart';
import 'package:globomatik_app/screens/warehouse/warehouse_zone_screen.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almacén'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _WarehouseCard(
            title: 'Calle A',
            capacity: '80%',
            items: 150,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WarehouseZoneScreen(zoneName: 'A'),
              ),
            ),
          ),
          _WarehouseCard(
            title: 'Calle B',
            capacity: '45%',
            items: 89,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WarehouseZoneScreen(zoneName: 'B'),
              ),
            ),
          ),
          _WarehouseCard(
            title: 'Calle C',
            capacity: '95%',
            items: 200,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WarehouseZoneScreen(zoneName: 'C'),
              ),
            ),
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
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
