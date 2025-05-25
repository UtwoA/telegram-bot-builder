import 'package:flutter/material.dart';

class BotHeader extends StatelessWidget {
  const BotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Название бота', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Состояние бота: активен', style: TextStyle(color: Colors.greenAccent)),
          ],
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // TODO: обработка выбора
          },
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'constructor', child: Text('Конструктор')),
            const PopupMenuItem(value: 'analytics', child: Text('Аналитика')),
            const PopupMenuItem(value: 'settings', child: Text('Настройки бота')),
            const PopupMenuItem(value: 'environment', child: Text('Настройки среды')),
          ],
        )
      ],
    );
  }
}