import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('База знаний'),
        backgroundColor: const Color(0xFF0E1621),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будут обучения работе на платформе',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}