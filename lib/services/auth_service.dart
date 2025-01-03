class AuthService {
  // Mock login function - Replace with actual API integration
  static Future<bool> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 5));

    // Mock validation
    if (email == 'globomatik' && password == 'globomatik') {
      return true;
    }
    throw Exception('Invalid credentials');

    /* 
    // TODO: Implement actual API integration
    try {
      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        // Store token securely (e.g., using flutter_secure_storage)
        return true;
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
    */
  }
}