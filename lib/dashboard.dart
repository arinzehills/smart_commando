import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:smart_commando/actions_page.dart';
import 'package:smart_commando/components/drawer.dart';
import 'package:smart_commando/components/myappbar.dart';
import 'package:smart_commando/components/mymenu.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:smart_commando/trigger_action.dart';
import 'components/gradient_text.dart';
import 'components/my_curve_container.dart';
import 'components/myoval_gradient_button.dart';
import 'components/scrollgradient_text.dart';
import 'constants/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    void bottomModal() {
      showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: Center(
                child: Text('dadksadhsh'),
              ),
            );
          });
    }

    Size size = MediaQuery.of(context).size;
    var scaffold = Scaffold(
      floatingActionButton: MyMenu(),
      drawer: MyDrawer(),
      // appBar: MyAppMenuBar(title: 'Home'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Builder(
              builder: (context) => Column(
                children: [
                  MyCurveContainer(
                    size: size,
                    height: size.height * 0.35,
                    showLogo: true,
                    right_widget: IconButton(
                      onPressed: () => {
                        // MyNavigate.navigatejustpush(Profile(), context)
                      },
                      icon: ImageIcon(
                        AssetImage('assets/user.png'),
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    curvecontainerwidget1: Padding(
                      padding: const EdgeInsets.only(left: 33.0, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: GradientText('Hi Chris!',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.white, Colors.grey],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.19,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  child: myCircle('assets/camera.png',
                                      'Monitor Household')),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return TriggerAction();
                                        });
                                  },
                                  child: myCircle('assets/smart_commando.png',
                                      'Trigger Action')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.20),
              child: Center(
                child: Container(
                  height: 200,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: myLightBrown.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 10,
                            offset: Offset(10, 30))
                      ]),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 21.0, left: 21, right: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Total actions',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Text(
                              'Total intrudes',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ScrollGradientText(
                                " kWh",
                                gradient: LinearGradient(
                                    // colors: [myLightOrange,myLightOrange]
                                    colors: myBrownGradient),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ScrollGradientText(
                                " kWh",
                                gradient: LinearGradient(
                                    // colors: [myLightOrange,myLightOrange]
                                    colors: myBrownGradient),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 50, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SafeArea(
                              child: MyOvalGradientButton(
                                placeHolder: 'View details',
                                pressed: () async {},
                                firstcolor: myLightBrown,
                                secondcolor: myBrown,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ]),
        ),
      ),
    );
    return scaffold;
  }

  Widget myCircle(imgUrl, label) => Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(65)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: myLightBrown.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 10,
                      offset: Offset(0, 30))
                ]),
            child: Center(
              child: Image.asset(
                imgUrl,
                height: 98,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Wrap(
              children: [
                Text(label),
              ],
            ),
          )
        ],
      );
}
