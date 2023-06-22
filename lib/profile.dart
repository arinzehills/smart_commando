import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_commando/auth/login.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/services/auth_service.dart';
import 'package:smart_commando/settings/profile_list.dart';
import 'components/mymenu.dart';
import 'components/normal_curve_container.dart';
import 'constants/my_navigate.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class UserWidget {
  String title;
  String? titleType;
  IconData? leading;
  UserWidget({required this.title, this.titleType, this.leading});
}

class _ProfileState extends State<Profile> {
  var userData;
  var userToken;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _getUserInfo();

    // var index = widget.index;
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var userJson = localStorage.getString('user');
    print(userJson);
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//     final user= Provider.of<MyUser>(context);
// final AuthService _auth=AuthService();
    String name = userData['full_name'] ?? 'no name';
    String address = userData['address'] ?? 'no address yet';
    String phone = userData['phone'] ?? 'no phone no added';
    String email = userData['email'] ?? 'Your email';

    List<UserWidget> title = [
      UserWidget(title: name, leading: Icons.person, titleType: 'full_name'),
      UserWidget(
          title: phone, leading: Icons.mobile_friendly, titleType: 'phone'),
      UserWidget(
          title: address, leading: Icons.location_on, titleType: 'address'),
      UserWidget(
          title: email, leading: Icons.email_outlined, titleType: 'email'),
      // UserWidget(title: '******',leading: Icons.password),
    ];
    return Scaffold(
      floatingActionButton: MyMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Builder(
              builder: (context) => Column(
                children: [
                  NormalCurveContainer(
                    size: size,
                    height: size.height * 0.24,
                    pagetitle: 'Profile',
                    widget: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Center(
                        child: Text(
                          userData['full_name'],
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: ListView.separated(
                      itemCount: title.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        //  DocumentSnapshot  document=snapshot.data as DocumentSnapshot<Object?>;
                        //    dynamic orderData=document.data();
                        return
                            // Container();
                            ProfileList(
                          name: title[index].title,
                          leading: title[index].leading,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [myBrown, myDarkBrown])),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(50)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [myBrown, myDarkBrown])),
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
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.8),
              child: Center(
                  child: MyButton(
                placeHolder: 'Edit profile',
                isGradientButton: true,
                gradientColors: myPinkGradient,
                pressed: () {
                  MyNavigate.navigatejustpush(EditProfile(), context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ImageIcon(
                    AssetImage('assets/edit_user.png'),
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )),
            ))
          ]),
        ),
      ),
    );
  }
}
