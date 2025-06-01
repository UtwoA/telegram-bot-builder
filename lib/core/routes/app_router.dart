import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/register_page.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/pages/bot_builder_page.dart';
import 'package:telegram_bot_builder/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:telegram_bot_builder/features/profile/presentation/pages/profile_page.dart';
import 'package:telegram_bot_builder/pages/start_page.dart';
import 'package:telegram_bot_builder/pages/feedback_page.dart';
import 'package:telegram_bot_builder/pages/tariff_page.dart';
import 'package:telegram_bot_builder/pages/help_center_page.dart';
import 'package:telegram_bot_builder/features/stats/presentation/pages/stats_page.dart';

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
      case '/feedback':
        return MaterialPageRoute(builder: (_) => const FeedbackPage());
      case '/helpcenter':
        return MaterialPageRoute(builder: (_) => const HelpCenterPage());
      case '/tariff':
        return MaterialPageRoute(builder: (_) => const TariffPage());
      case '/stats':
        return MaterialPageRoute(builder: (_) => const StatsPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const PersonalAccountScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Страница не найдена')),
          ),
        );
    }
  }
}