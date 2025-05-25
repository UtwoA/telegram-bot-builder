import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/auth/presentation/register_page.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/widgets/bot_constructor_area.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/widgets/bot_header.dart';
import '../widgets/bot_sidebar.dart';

class BotBuilderPage extends StatefulWidget {
  const BotBuilderPage({super.key});

  @override
  State<BotBuilderPage> createState() => _BotBuilderPageState();
}

class _BotBuilderPageState extends State<BotBuilderPage> {
  bool isSidebarExpanded = true;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Text(''),
    Text(''),
    Text(''),
    Text(''),
    Text(''),
  ];

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
          // 🔹 Боковая панель
          BotSideBar(
            isExpanded: isSidebarExpanded,
            onToggle: toggleSidebar,
            selectedIndex: _selectedIndex,
            onSlideTap: onItemTapped,
          ),

          // 🔸 Разделитель
          const VerticalDivider(width: 1, thickness: 1),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _pages[_selectedIndex],
            ),
          )
        ],
      ),
    );
  }
}