import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'features/auth/presentation/auth_view_model.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  final repository = AuthRepository(AuthApi(), AuthPrefs());
  runApp(
    MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel(repository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Bot Builder',
      // theme: AppTheme.darkTheme,
      initialRoute: '/start', // начальная страница
      onGenerateRoute: AppRouter.generateRoute, // навигация через AppRouter
      debugShowCheckedModeBanner: false,
    );
  }
}