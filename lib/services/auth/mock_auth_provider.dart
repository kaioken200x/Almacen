import 'package:globomatik_app/models/auth/auth_result.dart';
import 'package:globomatik_app/models/auth/user.dart';

class MockAuthProvider {
  User? _currentUser;

  Future<AuthResult> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock credentials
    if (email == 'globo' && password == '123') {
      _currentUser =
          User(id: '1', email: email, name: 'Test User', role: 'admin');

      return AuthResult(
          success: true, user: _currentUser, token: 'mock_jwt_token');
    }

    return const AuthResult(success: false, error: 'Credenciales inválidas');
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
}
