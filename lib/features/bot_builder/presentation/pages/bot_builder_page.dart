import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/bot_builder/presentation/pages/bot_builder_page_web.dart';
import 'bot_builder_page_mobile.dart';

class BotBuilderPage extends StatelessWidget {
  const BotBuilderPage({super.key,required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      return BotBuilderPageWeb(email:email);
    }

    return BotBuilderPageMobile(email:email);
  }
}