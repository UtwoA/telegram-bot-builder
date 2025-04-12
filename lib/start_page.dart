import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/custom_button.dart';
import 'package:telegram_bot_builder/custom_image.dart';
import 'package:telegram_bot_builder/text_widget.dart';
import 'package:telegram_bot_builder/wsized.dart';
import 'package:url_launcher/url_launcher.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Container(
                color: const Color(0xFF17212B),
                child: Column(children: [
                  WSizedBox(wval: 0, hval:0.1),
                  Center(child: TextWidget(
                    text: 'Product name',
                    textcolor: Color(0xFFD3DDEA),
                    textsize: 24,
                    fontWeight: FontWeight.normal
                    )
                  ),
                  WSizedBox(wval: 0, hval:0.03),
                  Center(child: TextWidget(
                    text: 'Registry name',
                    textcolor: Color(0xFFD9D9D9),
                    textsize: 16,
                    fontWeight: FontWeight.normal
                    )
                  ),
                  WSizedBox(wval: 0, hval:0.1),
                  CustomButton(
                    buttontext: 'Button text',
                    width: 0.33185840708,
                    height: 0.09540034071,
                    bordercolor: Color(0xFF41ACE4),
                    borderradius: 5,
                    fontsize: 17,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    onPressed: (){},
                  )
                ])
              ))
        ],
      ),
    );
  }
}