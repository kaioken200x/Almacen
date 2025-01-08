import 'package:globomatik_app/services/auth/mock_auth_provider.dart';
import 'package:globomatik_app/models/auth/auth_result.dart';
import 'package:globomatik_app/models/auth/user.dart';

class AuthService {
  final _authProvider = MockAuthProvider();

  Future<AuthResult> login(String email, String password) async {
    return _authProvider.login(email, password);
  }

  Future<void> logout() async {
    await _authProvider.logout();
  }

  User? get currentUser => _authProvider.currentUser;
  bool get isAuthenticated => _authProvider.isAuthenticated;
}
