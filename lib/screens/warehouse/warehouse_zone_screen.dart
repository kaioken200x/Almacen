import 'package:flutter/material.dart';

class WarehouseZoneScreen extends StatelessWidget {
  final String zoneName;

  const WarehouseZoneScreen({super.key, required this.zoneName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona $zoneName'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStatusCard(),
          const SizedBox(height: 16),
          _buildProductsList(),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado Actual',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProgressIndicator('Capacidad Total', 0.8),
            const SizedBox(height: 8),
            _buildProgressIndicator('Espacio Utilizado', 0.6),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value,
          minHeight: 10,
          backgroundColor: Colors.grey[200],
        ),
        const SizedBox(height: 4),
        Text('${(value * 100).toInt()}%'),
      ],
    );
  }

  Widget _buildProductsList() {
    final mockProducts = [
      {
        'nombre': 'Laptop Dell XPS',
        'cantidad': 25,
        'ubicacion': 'Estante A1',
      },
      {
        'nombre': 'Monitor LG 27"',
        'cantidad': 15,
        'ubicacion': 'Estante A2',
      },
      {
        'nombre': 'Teclado Mecánico',
        'cantidad': 50,
        'ubicacion': 'Estante A3',
      },
    ];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Productos en Zona',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockProducts.length,
            itemBuilder: (context, index) {
              final product = mockProducts[index];
              return ListTile(
                title: Text(product['nombre'] as String),
                subtitle: Text('Ubicación: ${product['ubicacion']}'),
                trailing: Text(
                  'Cantidad: ${product['cantidad']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
