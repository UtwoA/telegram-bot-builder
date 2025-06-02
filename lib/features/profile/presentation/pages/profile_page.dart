import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/profile_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/help_center_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/tariff_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/stats_card.dart';

class PersonalAccountScreen extends StatelessWidget {
  final Function(int)? onItemTapped;
  final String email;

  // Конструктор с onItemTapped (для BotBuilderPage)
  const PersonalAccountScreen({super.key, required this.onItemTapped, required this.email}) : assert(onItemTapped != null);

  // Конструктор без onItemTapped (для навигации через роут)
  const PersonalAccountScreen.route({super.key, required this.email}) : onItemTapped = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E1621),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileCard(email:email),
                  const SizedBox(height: 16),
                  const TariffCard(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HelpCenterCard(),
                  const SizedBox(height: 10),
                  StatsCard(
                    onItemTapped: onItemTapped ?? (int index) {}, // Если null — заглушка
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}