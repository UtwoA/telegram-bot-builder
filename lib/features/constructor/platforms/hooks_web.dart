import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_flow_chart/flutter_flow_chart.dart';
import 'package:http/http.dart' as http;
import 'package:web/web.dart' as web;

/// Save dashboard to file
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
  print('Произошла ошибка: ');

  // Добавляем email в JSON
  final jsonData = {
    'email': 'test@example.com',
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
Future<void> loadDashboard(Dashboard dashboard) async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;
  dashboard.loadDashboardData(
    jsonDecode(String.fromCharCodes(result.files.first.bytes!))
        as Map<String, dynamic>,
  );
}

/// Pick image
Future<Uint8List?> pickImageBytes() async {
  final pickResult = await FilePicker.platform.pickFiles(type: FileType.image);
  if (pickResult == null) return null;
  return pickResult.files.single.bytes;
}
