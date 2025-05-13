import 'package:flutter/material.dart';
import '../auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/custom_button.dart';
class LoginForm extends StatelessWidget {
  final AuthViewModel viewModel;

  const LoginForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          TextField(
            controller: viewModel.emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: viewModel.passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Пароль',
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Забыли пароль?',
                style: TextStyle(color: Colors.white60, fontSize: 10),
              ),
            ),
          ),
          if (viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                viewModel.error!,
                style: const TextStyle(color: Colors.red, fontSize: 10),
              ),
            ),
          const SizedBox(height: 8),
          CustomButton(
            buttontext: 'Войти',
            width: 0.08,
            height: 0.05,
            bordercolor: const Color(0xFF41ACE4),
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            onPressed: () {
              viewModel.login();
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            buttontext: 'Google',
            width: 0.08,
            height: 0.05,
            bordercolor: Colors.white,
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.black,
            onPressed: () {},
          ),
          const SizedBox(height: 6),
          CustomButton(
            buttontext: 'VK',
            width: 0.08,
            height: 0.05,
            bordercolor: const Color(0xFF456DBE),
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}