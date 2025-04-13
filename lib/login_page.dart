import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/custom_button.dart';
import 'package:telegram_bot_builder/custom_image.dart';
import 'package:telegram_bot_builder/text_widget.dart';
import 'package:telegram_bot_builder/wsized.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:telegram_bot_builder/login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  get emailController => TextEditingController();
  get passwordController => TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF242F3D),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Center(child: 
                const CustomImageWidget(
                  height: 0.35264054514,
                  width: 1,
                  imgpath: 'assets/images/reg_up.jpg',
                )
              ),
              Center(child: 
                const CustomImageWidget(
                  height: 0.35264054514,
                  width: 0.22898230088,
                  imgpath: 'assets/images/207.png',
                )
              ),
            ],
          ), 
          Expanded(
                  child: Center(child:
                  Container(
                  width: 400,
                  height:400,
                  decoration: BoxDecoration(color: const Color(0xFF17212B),borderRadius: BorderRadius.circular(12)),
                  child:Column(children: [
                  WSizedBox(wval: 0, hval:0.03),
                  Center(child: TextWidget(
                    text: 'Добро пожаловать!',
                    textcolor: Color(0xFFD9D9D9),
                    textsize: 16,                   
                    fontWeight: FontWeight.normal
                    )),
                  Row(children: [
                    Padding(padding: const EdgeInsets.fromLTRB(20, 20, 0, 0), child: 
                    CustomButton(
                    buttontext: 'Вход',
                    width: 0.1,
                    height: 0.07,
                    bordercolor: Color(0xFF41ACE4),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    onPressed: () {})),
                    Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), child: 
                    CustomButton(
                    buttontext: 'Регистрация',
                    width: 0.1,
                    height: 0.07,
                    bordercolor: Color(0xFF41ACE4),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, "/start"),
                  ))],),
                  Padding(padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                  child: SingleChildScrollView(child:ListBody(
                    children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFFFFFFFF)) ),
                      labelText: 'Email'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(filled:true,labelText: 'Пароль', fillColor: Color(0xFFFFFFFF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFFFFFFFF)) )),
                      obscureText: true,
                    ),
                   ],
                  ),
                  )),
                  Center(child:  CustomButton(
                    buttontext: 'Вход',
                    width: 0.1,
                    height: 0.07,
                    bordercolor: Color(0xFF41ACE4),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    onPressed: () {}))
                ])
              )))
        ],
      ),
    );
  }
}