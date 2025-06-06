import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/features/constructor/constructor_model.dart';

class ConstructorPage extends StatelessWidget {
  const ConstructorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: ConstructorPageModel()),
    );
  }
}
