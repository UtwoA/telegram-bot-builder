import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/login_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/register_page.dart';
import 'package:telegram_bot_builder/features/dashboard/dashboard_page.dart';
import 'package:telegram_bot_builder/start_page.dart';

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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Страница не найдена')),
          ),
        );
    }
  }
}