import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://your-laravel-api.com/api';
  static String? _token;

  static String? get token => _token;

  static Future<bool> login(String email, String password) async {
    try {
      /*final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _token = data['token'];
        return true;
      } else {
        throw Exception('Credenciales inválidas');
      }*/
      return true;
    } catch (e) {
      throw Exception('Error de inicio de sesión: $e');
    }
  }

  static Future<void> logout() async {
    _token = null;
  }

  static bool isAuthenticated() {
    return _token != null;
  }
}
