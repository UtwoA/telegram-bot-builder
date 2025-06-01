import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_settings_page.dart';
import 'package:telegram_bot_builder/features/constructor/constructor_page.dart';
import 'package:telegram_bot_builder/features/platform_settings/presentation/pages/platform_settings_page.dart';
import 'package:telegram_bot_builder/features/profile/presentation/pages/profile_page.dart';
import 'package:telegram_bot_builder/features/stats/presentation/pages/stats_page.dart';
import '../widgets/bot_sidebar.dart';

class BotBuilderPage extends StatefulWidget {
  const BotBuilderPage({super.key});

  @override
  State<BotBuilderPage> createState() => _BotBuilderPageState();
}

class _BotBuilderPageState extends State<BotBuilderPage> {
  late final List<Widget> _pages;
  late bool isMobile;

  bool isSidebarExpanded = true;
  int _selectedIndex = 0;

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

  void toggleSidebar() {
    setState(() {
      isSidebarExpanded = !isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Определяем, мобильное ли устройство
    final screenWidth = MediaQuery.of(context).size.width;
    isMobile = screenWidth < 600;

    // Автоматически сворачиваем сайдбар на мобильных
    if (isMobile && isSidebarExpanded) {
      isSidebarExpanded = false;
    }

    return Scaffold(
      body: Row(
        children: [
          BotSideBar(
            isExpanded: isSidebarExpanded,
            onToggle: toggleSidebar,
            selectedIndex: _selectedIndex,
            onSlideTap: onItemTapped,
            canExpand: !isMobile, // Не даём сворачивать на мобильных
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: _pages[_selectedIndex],
            ),
          )
        ],
      ),
    );
  }
}