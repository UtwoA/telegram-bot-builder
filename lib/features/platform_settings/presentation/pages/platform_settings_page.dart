import 'package:flutter/material.dart';

class PlatformSettingsPage extends StatelessWidget {
  const PlatformSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки платформы'),
        backgroundColor: const Color(0xFF0E1621),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будут настройки платформы',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}