import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/pages_mobile/start_page_mobile.dart';
import 'package:telegram_bot_builder/pages_mobile/start_page_web.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    final screenWidth = MediaQuery.of(context).size.width;

    // Если ширина экрана больше 600 — показываем веб-версию
    if (screenWidth > 600) {
      return const StartPageWeb();
    }

    // Иначе — мобильная версия
    return const StartPageMobile();
  }
}