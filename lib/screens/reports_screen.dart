import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ReportCard(
            title: 'Inventario por Almacén',
            description: 'Ver estado actual del inventario por ubicación',
            icon: Icons.bar_chart,
            onTap: () {},
          ),
          _ReportCard(
            title: 'Pedidos',
            description: 'Lista de pedidos',
            icon: Icons.point_of_sale_outlined,
            onTap: () {},
          ),
          _ReportCard(
            title: 'Movimientos',
            description: 'Historial de entradas y salidas',
            icon: Icons.sync_alt,
            onTap: () {},
          ),
          _ReportCard(
            title: 'Stock Bajo',
            description: 'Productos con stock mínimo',
            icon: Icons.inventory_2,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _ReportCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}