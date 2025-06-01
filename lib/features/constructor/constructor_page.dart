import 'package:flutter/material.dart';

class ConstructorPage extends StatelessWidget {
  const ConstructorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Конструктор в процессе реализации\nЗаглушка для Глеба',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}