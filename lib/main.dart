import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/auth_view_model.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
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
      theme: AppTheme.darkTheme,
      initialRoute: '/main', // начальная страница
      onGenerateRoute: AppRouter.generateRoute, // навигация через AppRouter
      debugShowCheckedModeBanner: false,
    );
  }
}