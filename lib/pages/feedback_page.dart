import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(); // Возвращаемся назад
          },
        ),
        title: const Text(
          'Связь с поддержкой',
          style: TextStyle(
            color: Colors.white, // Светлый текст заголовка
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color(0xFF0E1621),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Гарантируем светлый цвет текста
        ),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будет связь с поддержкой',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}