import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/registration/mobile/registration_page_mobile.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/registration/web/register_page_web.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return RegistrationPageWeb(); // Веб-интерфейс
      } else {
        return RegistrationPageMobile(); // Мобильный интерфейс
      }
    },
  );
}
}