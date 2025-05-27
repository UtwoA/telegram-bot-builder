import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  String? error;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final AuthRepository _repository;

  bool get isAuthenticated => _token != null;
  String? _token;

  AuthViewModel(AuthRepository repository) {
    _repository = repository;
  }

  Future<void> login() async {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    error = 'Заполните все поля';
    notifyListeners();
    return;
  }

  try {
    await _repository.login(email, password);
    error = null;
    _token = await _repository.getToken();
  } on Exception catch (e) {
    error = e.toString().replaceAll('Exception: ', '');
  } catch (_) {
    error = 'Ошибка входа';
  }

  notifyListeners();
}

  Future<void> register(String email, String password) async {
    if (password.length < 6) {
      error = 'Пароль должен быть не короче 6 символов';
      notifyListeners();
      return;
    }

    try {
      await _repository.register(email, password);
      error = null;
      _token = await _repository.getToken(); // Получаем токен после регистрации
    } catch (e) {
      error = e.toString().replaceAll('Exception: ', '');
    }

    notifyListeners();
  }

  void setError(String? message) {
    error = message;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    notifyListeners();
  }
}