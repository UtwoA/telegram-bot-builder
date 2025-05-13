import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/start_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/login_page.dart';
import 'package:telegram_bot_builder/features/auth/presentation/register_page.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/login",
      routes: {
        "/start": (context)=>StartPage(),
        "/login": (context)=>LoginPage(),
        "/register": (context)=>RegisterPage()
      },
    );
  }
}