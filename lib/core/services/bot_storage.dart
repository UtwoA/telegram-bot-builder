import 'package:telegram_bot_builder/core/services/bot.dart';

class BotStorage {
  static final BotStorage _instance = BotStorage._internal();

  factory BotStorage() => _instance;

  BotStorage._internal();

  List<Bot> bots = [
    Bot(
        name: "Мистер Бот",
        description: "Главный помощник",
        status: false,
        token: '7839467690:AAHH6YbV4aezefpyhiFw_RoKWLgT2b6Mbls',
        messagesSent: 1231,
        used: true),
    // Bot(name: "Тестовый бот", description: "Для тестирования", status: false, token: 'TOKEN_002', messagesSent: 546),
    // Bot(name: "Чат-бот поддержки", description: "Помогает пользователям", status: true, token: 'TOKEN_003', messagesSent: 890),
    // Bot(name: "Новостной бот", description: "Присылает свежие новости", status: true, token: 'TOKEN_004', messagesSent: 1500),
    // Bot(name: "FAQ бот", description: "Отвечает на частые вопросы", status: false, token: 'TOKEN_005', messagesSent: 200),
    // Bot(name: "Бот рассылки", description: "Рассылка уведомлений", status: true, token: 'TOKEN_006', messagesSent: 785),
    // Bot(name: "Справочный бот", description: "Информация по продуктам", status: true, token: 'TOKEN_007', messagesSent: 654),
    // Bot(name: "Telegram Helper", description: "Помощь по Telegram", status: false, token: 'TOKEN_008', messagesSent: 321),
    // Bot(name: "HR бот", description: "Вопросы по работе", status: true, token: 'TOKEN_009', messagesSent: 410),
    // Bot(name: "Бот опросов", description: "Проведение голосований", status: true, token: 'TOKEN_010', messagesSent: 987),
    // Bot(name: "Клиентский бот", description: "Поддержка клиентов", status: true, token: 'TOKEN_011', messagesSent: 1122),
    // Bot(name: "Финансовый бот", description: "Уведомления о платежах", status: false, token: 'TOKEN_012', messagesSent: 130),
    // Bot(name: "Образовательный бот", description: "Обучение пользователей", status: true, token: 'TOKEN_013', messagesSent: 678),
    // Bot(name: "Игровой бот", description: "Мини-игры и развлечения", status: true, token: 'TOKEN_014', messagesSent: 432),
    // Bot(name: "Погодный бот", description: "Прогноз погоды", status: false, token: 'TOKEN_015', messagesSent: 210),
    // Bot(name: "Здоровье бот", description: "Советы по здоровью", status: true, token: 'TOKEN_016', messagesSent: 567),
    // Bot(name: "Техподдержка бот", description: "Помощь с техническими вопросами", status: true, token: 'TOKEN_017', messagesSent: 890),
    // Bot(name: "Бот заказов", description: "Оформление заказов", status: true, token: 'TOKEN_018', messagesSent: 1001),
    // Bot(name: "Трекер задач", description: "Список дел и задач", status: false, token: 'TOKEN_019', messagesSent: 345),
    // Bot(name: "Бот-переводчик", description: "Перевод текста", status: true, token: 'TOKEN_020', messagesSent: 789),
  ];
}
