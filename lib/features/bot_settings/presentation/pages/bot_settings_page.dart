import 'package:flutter/material.dart';

class BotSettingsPage extends StatelessWidget {
  const BotSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки ботов'),
        backgroundColor: const Color(0xFF0E1621),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будут настройки ботов',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}