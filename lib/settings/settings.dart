import 'package:flutter/material.dart';
import 'package:smart_commando/auth/login.dart';
import 'package:smart_commando/components/drawer.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/profile.dart';
import 'package:smart_commando/services/auth_service.dart';
import 'package:smart_commando/settings/IoTDevices.dart';
import 'package:smart_commando/settings/serveilance_cameras.dart';
import '../components/mymenu.dart';
import '../components/normal_curve_container.dart';
import '../constants/my_navigate.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class UserWidget {
  String title;
  String? titleType;
  IconData? leading;
  UserWidget({required this.title, this.titleType, this.leading});
}

class _SettingsState extends State<Settings> {
  var userData;
  var userToken;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    // var index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: MyMenu(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Builder(
              builder: (context) => Column(
                children: [
                  NormalCurveContainer(
                    size: size,
                    height: size.height * 0.24,
                    pagetitle: 'Settings',
                    widget: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Center(
                        child: Text(
                          "userData['name']",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 2,
                  //   padding: EdgeInsets.only(bottom: 120),
                  //   decoration: BoxDecoration(
                  //       borderRadius:
                  //           BorderRadius.vertical(bottom: Radius.circular(50)),
                  //       gradient: LinearGradient(
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight,
                  //           colors: [myBrown, myDarkBrown])),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: myBoxDecoration(),
                          child: ListTile(
                            title: Text('Survelliance Cameras'),
                            contentPadding: EdgeInsets.all(15),
                            onTap: () => MyNavigate.navigatejustpush(
                                ServeilanceCameras(), context),
                            trailing: Icon(Icons.arrow_forward_ios),
                            leading: Icon(Icons.camera_front_sharp),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: myBoxDecoration(),
                          child: ListTile(
                            title: Text('IoT Devices'),
                            onTap: () => MyNavigate.navigatejustpush(
                                IoTDevices(), context),
                            contentPadding: EdgeInsets.all(15),
                            trailing: Icon(Icons.arrow_forward_ios),
                            leading: Icon(Icons.portable_wifi_off),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: myBoxDecoration(),
                          child: ListTile(
                            title: Text('Profile'),
                            onTap: () =>
                                MyNavigate.navigatejustpush(Profile(), context),
                            contentPadding: EdgeInsets.all(15),
                            trailing: Icon(Icons.arrow_forward_ios),
                            leading: Icon(Icons.supervised_user_circle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    placeHolder: 'Logout',
                    isOval: true,
                    widthRatio: 0.4,
                    pressed: () async {
                      var response = await AuthService().logout();
                      snackBar(Login(), context, 'Logged out successfully');
                    },
                  )
                ],
              ),
            ),
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.18),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/user.png",
                      height: 90,
                      color: Colors.white,
                    )),
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
