import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/services/bot_storage.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = BotStorage();
    final totalBots = storage.bots.length;
    final activeBots = storage.bots.where((bot) => bot.status).length;
    final totalMessages = storage.bots.fold<int>(0, (sum, bot) => sum + bot.messagesSent);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // === Общая статистика ===
            Card(
              color: AppColors.cardBackground,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Всего ботов: $totalBots",
                        style: AppTextStyles.textFieldText?.copyWith(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Активных ботов: $activeBots",
                        style: AppTextStyles.textFieldText?.copyWith(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Всего сообщений: $totalMessages",
                        style: AppTextStyles.textFieldText?.copyWith(fontSize: 16)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // === График активности (заглушка) ===
            Card(
              color: AppColors.cardBackground,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Активность за неделю",
                        style: AppTextStyles.textFieldText
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 10),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "📊 Здесь будет график активности",
                          style: AppTextStyles.textFieldText
                              ?.copyWith(color: Colors.white60, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // === Список ботов ===
            Text(
              "Боты",
              style: AppTextStyles.textFieldText
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            if (storage.bots.isEmpty)
              Card(
                color: AppColors.cardBackground,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Вы ещё не добавили ни одного бота.",
                    style: AppTextStyles.textFieldText?.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              ...storage.bots.map((bot) => Card(
                  color: AppColors.cardBackground,
                  elevation: 2,
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
                              style: AppTextStyles.textFieldText?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            bot.status
                                ? Icon(Icons.check_circle, color: Colors.greenAccent)
                                : Icon(Icons.cancel, color: Colors.redAccent),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("Описание: ${bot.description}", style: AppTextStyles.textFieldText?.copyWith(fontSize: 12)),
                        Text("Сообщений отправлено: ${bot.messagesSent}", style: AppTextStyles.textFieldText?.copyWith(fontSize: 12)),
                        Text(bot.status ? "Статус: Активен" : "Статус: Остановлен", style: AppTextStyles.textFieldText?.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                )).toList(),
          ],
        ),
      ),
    );
  }
}