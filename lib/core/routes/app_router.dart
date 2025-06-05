import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/login_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/registration_page.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/pages/bot_builder_page.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/add_bot_page.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_details_page.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_settings_page.dart';
import 'package:telegram_bot_builder/features/constructor/constructor_page.dart';
import 'package:telegram_bot_builder/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:telegram_bot_builder/features/profile/presentation/pages/profile_page.dart';
import 'package:telegram_bot_builder/pages/payment_history_page.dart';
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
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case '/main':
        return MaterialPageRoute(builder: (_) {
          final arguments = settings.arguments as Map<String, dynamic>?;
          return  BotBuilderPage(email: arguments?['email']??'Email не найден');
        });
      case '/feedback':
        return MaterialPageRoute(builder: (_) => const FeedbackPage());
      case '/helpcenter':
        return MaterialPageRoute(builder: (_) => const HelpCenterPage());
      case '/tariff':
        return MaterialPageRoute(builder: (_) => const TariffPage());
      case '/payment-history':
        return MaterialPageRoute(builder: (_) => const PaymentHistoryPage());
      case '/stats':
        return MaterialPageRoute(builder: (_) => StatsPage());
      case '/constructor':
        return MaterialPageRoute(builder: (_) => const ConstructorPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const PersonalAccountScreen.route(email: ''));
      case '/bot-settings':
        return MaterialPageRoute(builder: (_) => const BotSettingsPage());
      case '/bot-settings/add':
        return MaterialPageRoute(builder: (_) => const AddBotPage());
      case '/bot-settings/details':
        final bot = settings.arguments;
        return MaterialPageRoute(builder: (_) => BotDetailsPage(bot: bot));
      case '/bot-builder':
        return MaterialPageRoute(builder: (_) => const ConstructorPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Страница не найдена')),
          ),
        );
    }
  }
}