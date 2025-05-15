import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';

class AuthViewModel extends ChangeNotifier {
  String? error;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final AuthRepository _repository;

  AuthViewModel() {
    _repository = AuthRepository(AuthApi(), AuthPrefs());
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      error = 'Заполните все поля';
      notifyListeners();
      return;
    }

    try {
      await _repository.login(email, password);
      error = null;
    } catch (e) {
      error = e.toString();
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
    } catch (e) {
      error = e.toString();
    }

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