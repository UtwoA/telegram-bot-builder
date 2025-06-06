import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
  static const String _tokenKey = 'jwt_token';
  static const String _email = 'user_email';
  static const String _password = '1234567';
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_email, email);
  }

  Future<String?> getEMail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_email);
  }
  Future<void> savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_password, password);
  }

  Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password);
  }

}