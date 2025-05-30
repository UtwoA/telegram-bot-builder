import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';

class AuthRepository {
  final AuthApi api;
  final AuthPrefs prefs;

  AuthRepository(this.api, this.prefs);

  Future<void> login(String email, String password) async {
    try {
      final result = await api.login(email, password);
      await prefs.saveToken(result['token']['access']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
  final result = await api.register(email, password);
  final token = result['token']['access'];

  await prefs.saveToken(token);
  if (!result.containsKey('user')) {
    throw Exception('Не удалось создать пользователя');
  }
}
  Future<String?> getToken() async {
  return prefs.getToken();
}
}