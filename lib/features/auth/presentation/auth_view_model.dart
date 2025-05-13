import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  String? error;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

    Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      error = 'Заполните все поля';
      notifyListeners();
      return;
    }

    try {
      print("penis");
      final response = await http.post(
        Uri.parse('https://b2ae-45-10-42-117.ngrok-free.app/user/login/'),
        headers: {'Content-Type': 'application/json',
        'Accept': 'application/json',},
        body: jsonEncode({'email': email, 'password': password}),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token']['access'];

        // Сохраняем токен
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt_token', token);

        error = null;
        notifyListeners();

        // TODO: Навигация на Dashboard
      } else {
        final data = jsonDecode(response.body);
        error = data['message'] ?? 'Ошибка входа';
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    try {
      // Имитация регистрации
      await Future.delayed(const Duration(seconds: 1));

      if (password.length < 6) {
        error = 'Пароль должен быть не короче 6 символов';
      } else {
        error = null;
      }
    } catch (e) {
      error = 'Ошибка регистрации';
    }
    notifyListeners();
  }

  // Очистка контроллеров при выходе или переключении экранов
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
