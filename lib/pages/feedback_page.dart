import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Связь с поддержкой'),
        backgroundColor: const Color(0xFF0E1621),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будет связь с поддержкой',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}