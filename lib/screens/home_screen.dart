import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_app/screens/product_search_screen.dart';
import 'package:inventory_app/screens/reports_screen.dart';
import 'package:inventory_app/screens/warehouse_screen.dart';
import 'package:inventory_app/widgets/user_profile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Salir de la aplicación?'),
        content: const Text('¿Está seguro que desea salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('Sí'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sistema de Inventario'),
          actions: const [UserProfileWidget()],
          automaticallyImplyLeading: false,
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(24),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _MenuCard(
              icon: Icons.inventory,
              title: 'Productos',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductSearchScreen()),
              ),
            ),
            _MenuCard(
              icon: Icons.warehouse,
              title: 'Almacén',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WarehouseScreen()),
              ),
            ),
            _MenuCard(
              icon: Icons.assessment,
              title: 'Informes',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              ),
            ),
            _MenuCard(
              icon: Icons.logout,
              title: 'Cerrar Sesión',
              onTap: () => _onWillPop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
