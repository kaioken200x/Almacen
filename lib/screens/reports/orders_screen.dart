import 'package:flutter/material.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _OrderItem(
            orderNumber: 'PED-001',
            date: '15/01/2024',
            status: 'Pendiente',
            items: '5 Laptops XPS',
            total: '\$6,500',
            statusColor: Colors.orange,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OrderDetailScreen(
                  orderNumber: 'PED-001',
                  date: '15/01/2024',
                  status: 'Pendiente',
                  items: '5 Laptops XPS',
                  total: '\$6,500',
                  statusColor: Colors.orange,
                ),
              ),
            ),
          ),
          _OrderItem(
            orderNumber: 'PED-002',
            date: '14/01/2024',
            status: 'Completado',
            items: '10 Monitores Dell',
            total: '\$3,000',
            statusColor: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OrderDetailScreen(
                  orderNumber: 'PED-002',
                  date: '14/01/2024',
                  status: 'Completado',
                  items: '10 Monitores Dell',
                  total: '\$3,000',
                  statusColor: Colors.green,
                ),
              ),
            ),
          ),
          _OrderItem(
            orderNumber: 'PED-003',
            date: '13/01/2024',
            status: 'Cancelado',
            items: '20 Teclados',
            total: '\$1,000',
            statusColor: Colors.red,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OrderDetailScreen(
                  orderNumber: 'PED-003',
                  date: '13/01/2024',
                  status: 'Cancelado',
                  items: '20 Teclados',
                  total: '\$1,000',
                  statusColor: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String status;
  final String items;
  final String total;
  final Color statusColor;
  final VoidCallback onTap;

  const _OrderItem({
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.items,
    required this.total,
    required this.statusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderNumber,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(date),
                ],
              ),
              const SizedBox(height: 8),
              Text('Items: $items'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(color: statusColor),
                    ),
                  ),
                  Text(
                    total,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
