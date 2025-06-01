import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl = 'https://7ee9-45-10-42-117.ngrok-free.app';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'login': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Ошибка входа');
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/user/register/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  // Проверяем, что сервер вернул JSON
  if (!(response.headers['content-type']?.contains('application/json') ?? false)) {
    throw Exception('Ошибка сервера');
  }

  // Парсим JSON
  final data = jsonDecode(response.body);

  // Если статус ошибочный
  if (response.statusCode != 201) {
    throw Exception(data['message'] ?? 'Не удалось зарегистрироваться');
  }

  return data;
}
}