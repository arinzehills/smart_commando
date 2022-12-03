import 'package:flutter/material.dart';
import 'package:smart_commando/components/drawer.dart';
import 'package:smart_commando/components/myappbar.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/mymenu.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/trigger_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCamera = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MyMenu(),
        drawer: MyDrawer(),
        appBar: MyAppMenuBar(title: 'Home'),
        body: Stack(
          children: [
            Positioned(
              bottom: 16,
              right: -2,
              child: Image.asset(
                'assets/smarthome.jpg',
                width: size(context).height * 0.905,
                height: size(context).height * 0.9,
              ),
            ),
            Positioned(
              bottom: 56,
              right: size(context).width * 0.3,
              child: MyButton(
                placeHolder: showCamera ? 'Fire' : 'View Room',
                isGradientButton: true,
                gradientColors: [
                  Colors.amber,
                  Color.fromARGB(255, 255, 4, 255)
                ],
                pressed: () => showCamera
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TriggerAction();
                        })
                    : {setState(() => showCamera = !showCamera)},
                isOval: true,
                widthRatio: 0.4,
              ),
            ),
          ],
        ));
  }
}
