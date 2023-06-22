import 'package:flutter/material.dart';
import 'package:smart_commando/auth/login.dart';
import 'package:smart_commando/components/drawer.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/myappbar.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/mymenu.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:smart_commando/trigger_action.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: MyMenu(),
        // appBar: MyAppMenuBar(title: 'Home'),
        body: Stack(
      children: [
        // Text('data'),
        Positioned(
          bottom: 1,
          right: -99,
          child: Image.asset(
            'assets/smart_sec-bg3.jpg',
            width: size(context).height * 0.655,
            height: size(context).height * 1.0,
          ),
        ),
        Positioned(
          bottom: size(context).height * 0.6,
          right: -99,
          child: Container(
            margin: EdgeInsets.only(top: 48.0),
            child: Image.asset(
              'assets/logo.png',
              width: size(context).height * 0.655,
              height: size(context).height * 0.25,
            ),
          ),
        ),
        Positioned(
          bottom: size(context).height * 0.55,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: GradientText(
                  'Sweet & Secure Smart Home',
                  gradient: LinearGradient(colors: myPinkGradient),
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
              ),
              SizedBox(
                width: size(context).width * 0.9,
                child: Text(
                  'Secure your smart home and handle intruder smarter than he thinks he is',
                  style: TextStyle(color: Color.fromARGB(200, 103, 101, 101)),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 56,
          right: size(context).width * 0.18,
          child: MyButton(
            placeHolder: 'Get Smart Security',
            isGradientButton: true,
            gradientColors: [
              Color.fromARGB(255, 252, 190, 6),
              Color.fromARGB(255, 255, 4, 255)
            ],
            pressed: () => {MyNavigate.navigatejustpush(Login(), context)},
            isOval: true,
            widthRatio: 0.6,
          ),
        ),
      ],
    ));
  }
}
