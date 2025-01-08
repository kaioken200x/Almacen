import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String status;
  final String items;
  final String total;
  final Color statusColor;

  const OrderDetailScreen({
    Key? key,
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.items,
    required this.total,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Pedido $orderNumber'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de Pedido: $orderNumber',
                style: TextStyle(fontSize: 18)),
            Text('Fecha: $date', style: TextStyle(fontSize: 18)),
            Text('Estado: $status',
                style: TextStyle(fontSize: 18, color: statusColor)),
            Text('Items: $items', style: TextStyle(fontSize: 18)),
            Text('Total: $total', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
