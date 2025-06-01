import 'package:flutter/material.dart';

class TariffPage extends StatelessWidget {
  const TariffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тарифные планы'),
        backgroundColor: const Color(0xFF0E1621),
      ),
      backgroundColor: const Color(0xFF0E1621),
      body: const Center(
        child: Text(
          'Здесь будут тарифные планы',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}