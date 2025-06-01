import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/widgets/login/web/login_page_web.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return LoginPageWeb(); // Веб-интерфейс
      } else {
        return LoginPageWeb(); // Мобильный интерфейс
      }
    },
  );
}
}