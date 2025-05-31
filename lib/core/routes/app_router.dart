import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/register_page.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/pages/bot_builder_page.dart';
import 'package:telegram_bot_builder/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:telegram_bot_builder/pages/start_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/start':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case '/main':
        return MaterialPageRoute(builder: (_) => const BotBuilderPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Страница не найдена')),
          ),
        );
    }
  }
}