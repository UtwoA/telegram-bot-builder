import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/services/bot.dart';
import 'package:telegram_bot_builder/core/services/bot_storage.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/widgets/AddBotModal.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/widgets/BotDetailsModal.dart';

class BotSettingsPage extends StatefulWidget {
  const BotSettingsPage({Key? key}) : super(key: key);

  static const routeName = '/bot-settings';

  @override
  State<BotSettingsPage> createState() => _BotSettingsPageState();
}

class _BotSettingsPageState extends State<BotSettingsPage> {
  

  late List<Bot> bots;

  @override
  void initState() {
    super.initState();
    bots = BotStorage().bots; // ← Берём данные из хранилища
  }

  void _showAddBotModal(BuildContext context) async {
  final newBot = await showDialog<Bot>(
    context: context,
    builder: (context) => const AddBotModal(),
  );

  if (newBot != null && mounted) {
    setState(() {
      bots.add(newBot);
    });
  }
}

  void _deleteBot(int index) {
    setState(() {
      bots.removeAt(index);
    });
  }

  void _toggleBotStatus(int index) {
    setState(() {
      bots[index] = bots[index].copyWith(status: !bots[index].status);
    });
  }

  void _showBotDetailsModal(BuildContext context, int index, Bot bot) async {
    final updatedBot = await showDialog<Bot>(
      context: context,
      builder: (context) => BotDetailsModal(bot: bot),
    );

    if (updatedBot != null && mounted) {
      setState(() {
        bots[index] = updatedBot;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: AppColors.background,
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                fixedSize: const Size(double.infinity, 40),
              ),
              onPressed: () => _showAddBotModal(context), // ← Вызов модального окна
              icon: Icon(Icons.add, color: AppColors.secondary),
              label: Text("Добавить нового бота", style: AppTextStyles.button),
            ),
            const SizedBox(height: 16),
            Expanded(
              
              child: ListView.builder(
                itemCount: bots.length,
                itemBuilder: (context, index) {
                  final bot = bots[index];
                  return GestureDetector(
                    onTap: () {
                      _showBotDetailsModal(context, index, bot);
                    },
                    child: Card(
                      color: AppColors.cardBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  bot.name,
                                  style: AppTextStyles.textFieldLabel
                                      ?.copyWith(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _toggleBotStatus(index),
                                      icon: Icon(
                                        bot.status
                                            ? Icons.pause_circle_outline
                                            : Icons.play_circle_outline,
                                        color: bot.status
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          _deleteBot(index),
                                      icon: Icon(Icons.delete,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "Описание: ${bot.description}",
                              style: AppTextStyles.textFieldLabel,
                            ),
                            Text(
                              "Статус: ${bot.status ? "🟢 онлайн" : "🔴 оффлайн"}",
                              style: AppTextStyles.textFieldLabel,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


