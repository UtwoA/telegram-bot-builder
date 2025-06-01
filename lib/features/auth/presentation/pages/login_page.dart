import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login/mobile/login_page_mobile.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login/web/login_page_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return LoginPageWeb(); // Веб-интерфейс
      } else {
        return LoginPageMobile(); // Мобильный интерфейс
      }
    },
  );
}
}