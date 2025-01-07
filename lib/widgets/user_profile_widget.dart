import 'package:flutter/material.dart';
import 'package:inventory_app/services/auth/auth_service.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final user = authService.currentUser;

    if (user == null) return const SizedBox.shrink();

    return PopupMenuButton(
      icon: const Icon(Icons.account_circle),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(user.email),
              Text('Rol: ${user.role}'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          child: Text('Perfil'),
        ),
        const PopupMenuItem(
          child: Text('Configuraciones'),
        ),
        PopupMenuItem(
          child: const Text('Cerrar Sesión'),
          onTap: () async {
            await authService.logout();
            if (context.mounted) {
              Navigator.of(context).pushReplacementNamed('/login');
            }
          },
        ),
      ],
    );
  }
}
