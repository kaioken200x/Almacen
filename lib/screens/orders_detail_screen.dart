import 'package:flutter/material.dart';

class OrdersDetailScreen extends StatelessWidget {
  const OrdersDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Pedidos'),
      ),
      body: Center(
        child: Text('Detalles de Pedidos'),
      ),
    );
  }
}
