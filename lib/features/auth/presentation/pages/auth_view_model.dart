import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  String? error;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  bool _isConfirmPasswordVisible = false;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  late final AuthRepository _repository;
  String? _token;
  String? EEmail;
  String? TToken;

  Future<String?> get_token() async{
    return _repository.prefs.getToken();
  }
  Future<String?> get_email() async{
    return _repository.prefs.getEMail();
  }

  bool get isAuthenticated => _token != null;

  AuthViewModel(AuthRepository repository) {
    _repository = repository;
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
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
      TToken=_token;
      EEmail=email;
    } catch (e) {
      error = e.toString().replaceAll('Exception: ', '');
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
      _token = await _repository.getToken();
      TToken=_token;
      EEmail=email;
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
    confirmController.dispose();
    notifyListeners();
  }
}