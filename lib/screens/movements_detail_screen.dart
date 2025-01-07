import 'package:flutter/material.dart';

class MovementsDetailScreen extends StatelessWidget {
  const MovementsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Movimientos'),
      ),
      body: Center(
        child: Text('Detalles de Movimientos'),
      ),
    );
  }
}
