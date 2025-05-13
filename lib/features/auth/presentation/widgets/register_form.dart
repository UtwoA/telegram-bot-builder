import 'package:flutter/material.dart';
import '../auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);
    return Container(
      width: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A3C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Регистрация', style: TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Пароль'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              viewModel.register(
                _emailController.text,
                _passwordController.text,
              );
            },
            child: const Text('Зарегистрироваться'),
          ),
          const SizedBox(height: 16),
          if (viewModel.error != null)
            Text(viewModel.error!, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
