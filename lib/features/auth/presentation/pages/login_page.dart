import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login_page_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return LoginPageWeb(); // Например, с двумя колонками
      } else {
        return LoginPageWeb(); // Простой линейный интерфейс
      }
    },
  );
}
}