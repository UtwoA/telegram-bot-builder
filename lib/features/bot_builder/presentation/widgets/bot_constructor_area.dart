import 'package:flutter/material.dart';

class BotConstructorArea extends StatelessWidget {
  const BotConstructorArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧩 "Действия и условия"
            _buildSectionTitle('Действия и условия'),
            ListTile(
              leading: const Icon(Icons.play_arrow, color: Colors.blue),
              title: const Text('Действие 1', style: TextStyle(color: Colors.white)),
              tileColor: Colors.grey[850],
            ),
            ListTile(
              leading: const Icon(Icons.check_box, color: Colors.orange),
              title: const Text('Условие 1', style: TextStyle(color: Colors.white)),
              subtitle: const Text('0,12', style: TextStyle(color: Colors.white70)),
              tileColor: Colors.grey[850],
            ),

            const SizedBox(height: 24),

            // 📦 Блоки
            _buildSectionTitle('Блоки'),
            const ListTile(
              leading: Icon(Icons.category, color: Colors.purple),
              title: Text('Пласк', style: TextStyle(color: Colors.white)),
              tileColor: Color.fromRGBO(48, 48, 48, 1),
            ),
            const ListTile(
              title: Text('Блок 1', style: TextStyle(color: Colors.white70)),
              tileColor: Color.fromRGBO(66, 66, 66, 1),
            ),
            const ListTile(
              title: Text('Блок 2', style: TextStyle(color: Colors.white70)),
              tileColor: Color.fromRGBO(66, 66, 66, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}