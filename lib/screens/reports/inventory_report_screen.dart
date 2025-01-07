import 'package:flutter/material.dart';

class InventoryReportScreen extends StatelessWidget {
  const InventoryReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario por Almacén'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWarehouseReport(
            'Zona A',
            [
              {'producto': 'Laptops', 'cantidad': 50, 'valor': '\$65,000'},
              {'producto': 'Monitores', 'cantidad': 30, 'valor': '\$12,000'},
              {'producto': 'Teclados', 'cantidad': 100, 'valor': '\$5,000'},
            ],
          ),
          const SizedBox(height: 16),
          _buildWarehouseReport(
            'Zona B',
            [
              {'producto': 'Ratones', 'cantidad': 200, 'valor': '\$6,000'},
              {'producto': 'Auriculares', 'cantidad': 75, 'valor': '\$7,500'},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWarehouseReport(String zone, List<Map<String, dynamic>> items) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              zone,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Producto')),
                DataColumn(label: Text('Cantidad')),
                DataColumn(label: Text('Valor Total')),
              ],
              rows: items.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['producto'])),
                  DataCell(Text(item['cantidad'].toString())),
                  DataCell(Text(item['valor'])),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}