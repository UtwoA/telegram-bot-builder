import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_flow_chart/flutter_flow_chart.dart';
import 'package:http/http.dart' as http;
import 'package:web/web.dart' as web;
import 'package:telegram_bot_builder/core/services/bot.dart';
import 'package:telegram_bot_builder/core/services/bot_storage.dart';

// // Save dashboard to file
// Future<void> saveDashboard(Dashboard dashboard) async {
//   final bytes = utf8.encode(dashboard.prettyJson());
//   final anchor = web.document.createElement('a') as web.HTMLAnchorElement
//     ..href = 'data:application/octet-stream;base64,${base64Encode(bytes)}'
//     ..style.display = 'none'
//     ..download = 'FLOWCHART.json';
//   web.document.body!.appendChild(anchor);
//   anchor.click();
//   web.document.body!.removeChild(anchor);
// }
Future<void> saveDashboard(Dashboard dashboard) async {
  final url = Uri.parse('http://127.0.0.1:5000/save');
  final headers = {'Content-Type': 'application/json'};
  String? token;
  for (int i = 0; i < BotStorage().bots.length; ++i) {
    if (BotStorage().bots[i].used) {
      token = BotStorage().bots[i].token;
    }
  }

  if (token == null) return;
  print(token);

  final jsonData = {
    'key': token,
    'blocks': dashboard.toJson(),
  };

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(jsonData),
    );

    if (response.statusCode == 200) {
      print('Данные успешно отправлены');
    } else {
      print('Ошибка при отправке данных: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

/// Load dashboard from file
// Future<void> loadDashboard(Dashboard dashboard) async {
//   final result = await FilePicker.platform.pickFiles();
//   if (result == null) return;
//   dashboard.loadDashboardData(
//     jsonDecode(String.fromCharCodes(result.files.first.bytes!))
//         as Map<String, dynamic>,
//   );
// }

Future<void> loadDashboard(Dashboard dashboard) async {
  String? token;
  for (int i = 0; i < BotStorage().bots.length; ++i) {
    if (BotStorage().bots[i].used) {
      token = BotStorage().bots[i].token;
    }
  }
  print(token);

  if (token == null) return;

  final url = Uri.parse('http://127.0.0.1:5000/load/$token');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data is Map<String, dynamic>) {
        dashboard.loadDashboardData(jsonDecode(data['value']));
        print('Данные успешно загружены');
      } else {
        print('Полученные данные не являются Map<String, dynamic>: $data');
      }
    } else {
      print('Ошибка при запросе: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

/// Pick image
Future<Uint8List?> pickImageBytes() async {
  final pickResult = await FilePicker.platform.pickFiles(type: FileType.image);
  if (pickResult == null) return null;
  return pickResult.files.single.bytes;
}
