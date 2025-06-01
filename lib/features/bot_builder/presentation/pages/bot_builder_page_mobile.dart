// bot_builder_page_mobile.dart
import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_settings_page.dart';
import 'package:telegram_bot_builder/features/constructor/constructor_page.dart';
import 'package:telegram_bot_builder/features/platform_settings/presentation/pages/platform_settings_page.dart';
import 'package:telegram_bot_builder/features/profile/presentation/pages/profile_page.dart';
import 'package:telegram_bot_builder/features/stats/presentation/pages/stats_page.dart';

class BotBuilderPageMobile extends StatefulWidget {
  const BotBuilderPageMobile({super.key});

  @override
  State<BotBuilderPageMobile> createState() => _BotBuilderPageMobileState();
}

class _BotBuilderPageMobileState extends State<BotBuilderPageMobile> {
  int _selectedIndex = 0;
    late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      PersonalAccountScreen(onItemTapped: onItemTapped),
      ConstructorPage(),
      StatsPage(),
      BotSettingsPage(),
      PlatformSettingsPage(),
    ];
  }


  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF242F3D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Конструктор'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: 'Аналитика'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Н-ки ботов'),
          BottomNavigationBarItem(icon: Icon(Icons.desktop_windows), label: 'Н-ки среды'),
        ],
      ),
    );
  }
}