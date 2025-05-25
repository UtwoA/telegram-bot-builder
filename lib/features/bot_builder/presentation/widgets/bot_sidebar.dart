import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';

class BotSideBar extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;
  final int selectedIndex;
  final ValueSetter<int> onSlideTap;

  const BotSideBar({
    super.key,
    required this.isExpanded,
    required this.onToggle,
    required this.selectedIndex,
    required this.onSlideTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? 250 : 75,
      color: AppColors.cardBackground,
      child: Column(
        children: [
          // Кнопка сворачивания
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isExpanded)
                  const Text('Меню', style: TextStyle(color: Colors.white)),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                    color: Colors.white70,
                    size: 16,
                  ),
                  onPressed: onToggle,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white12, height: 1),

          // Меню
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(), // отключаем скролл
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(Icons.person, 'Личный кабинет', isExpanded, 0),
                _buildMenuItem(Icons.edit, 'Конструктор', isExpanded, 1),
                _buildMenuItem(Icons.insert_chart, 'Аналитика', isExpanded, 2),
                _buildMenuItem(Icons.settings, 'Настройка бота', isExpanded, 3),
                _buildMenuItem(Icons.desktop_windows, 'Настройка среды', isExpanded, 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, bool expanded, int index) {
    final isSelected = index == selectedIndex;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.menuItemSelected : AppColors.menuItemDefault,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: Icon(icon, color: Colors.white70),
          title: expanded
              ? Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                )
              : null,
          onTap: () => onSlideTap(index),
        ),
      ),
    );
  }
}