import 'package:globomatik_app/models/auth/user.dart';

class AuthResult {
  final bool success;
  final User? user;
  final String? token;
  final String? error;

  const AuthResult({
    required this.success,
    this.user,
    this.token,
    this.error,
  });
}
