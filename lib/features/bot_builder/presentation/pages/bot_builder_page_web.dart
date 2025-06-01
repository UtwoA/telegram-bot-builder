import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_settings_page.dart';
import 'package:telegram_bot_builder/features/constructor/constructor_page.dart';
import 'package:telegram_bot_builder/features/platform_settings/presentation/pages/platform_settings_page.dart';
import 'package:telegram_bot_builder/features/profile/presentation/pages/profile_page.dart';
import 'package:telegram_bot_builder/features/stats/presentation/pages/stats_page.dart';
import '../widgets/bot_sidebar_web.dart';

class BotBuilderPageWeb extends StatefulWidget {
  const BotBuilderPageWeb({super.key});

  @override
  State<BotBuilderPageWeb> createState() => _BotBuilderPageState();
}

class _BotBuilderPageState extends State<BotBuilderPageWeb> {
  late final List<Widget> _pages;

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
    return Scaffold(
      body: Row(
        children: [
          BotSideBarWeb(
            isExpanded: isSidebarExpanded,
            onToggle: toggleSidebar,
            selectedIndex: _selectedIndex,
            onSlideTap: onItemTapped,
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