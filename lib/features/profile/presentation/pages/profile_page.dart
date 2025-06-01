import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/profile_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/help_center_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/tariff_card.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/stats_card.dart';

class PersonalAccountScreen extends StatelessWidget {
  const PersonalAccountScreen({super.key});

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
                  const ProfileCard(),
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
                  const StatsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}