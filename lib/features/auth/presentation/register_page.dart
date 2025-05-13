import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_view_model.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const Scaffold(
        backgroundColor: Color(0xFF1E1E2E),
        body: Center(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
