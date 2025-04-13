import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/start_page.dart';
import 'package:telegram_bot_builder/login_page.dart';
void main() {
  runApp(const MyApp());
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
      initialRoute: "/start",
      routes: {
        "/start": (context)=>StartPage(),
        "/login": (context)=>LoginPage()
      },
    );
  }
}