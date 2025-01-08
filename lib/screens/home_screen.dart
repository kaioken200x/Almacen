import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globomatik_app/screens/product_search_screen.dart';
import 'package:globomatik_app/screens/reports_screen.dart';
import 'package:globomatik_app/screens/warehouse_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _appVersion = '1.0.0';
  String _loggedInUser = 'Usuario';

  @override
  void initState() {
    super.initState();
    _fetchAppInfo();
  }

  Future<void> _fetchAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
      _loggedInUser = 'Usuario Logado';
    });
  }

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
          title: Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              'assets/images/globomatik.png',
              height: 50,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MenuCard(
              icon: Icons.inventory,
              title: 'Productos',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductSearchScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _MenuCard(
              icon: Icons.warehouse,
              title: 'Almacén',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WarehouseScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _MenuCard(
              icon: Icons.assessment,
              title: 'Informes',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _MenuCard(
              icon: Icons.logout,
              title: 'Cerrar Sesión',
              onTap: () => _onWillPop(context),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Información'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Usuario: $_loggedInUser'),
                    Text('Versión: $_appVersion'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _onWillPop(context);
                    },
                    child: const Text('Cerrar Sesión'),
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.info),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 48),
              const SizedBox(width: 16),
              Text(title, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
