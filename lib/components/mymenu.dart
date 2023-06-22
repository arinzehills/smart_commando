import 'package:smart_commando/actions_page.dart';
import 'package:smart_commando/auth/login.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:smart_commando/services/auth_service.dart';
import 'package:smart_commando/settings/settings.dart';

import '../home_page.dart';
import '../profile.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
        fabOpenColor: myPinkGradient[1],
        fabCloseColor: Colors.white,
        ringColor: mypink.withOpacity(0.62),
        fabOpenIcon: ImageIcon(
          AssetImage('assets/fabmenu.png'),
          size: 90,
          color: myBrown,
        ),
        children: [
          InkWell(
            onTap: () {
              MyNavigate.navigatepushuntil(HomePage(), context);
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              MyNavigate.navigatejustpush(ActionsPage(user_id: 2), context);
            },
            child: ImageIcon(
              AssetImage('assets/action.png'),
              size: 40,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              MyNavigate.navigatejustpush(Profile(), context);
            },
            child: ImageIcon(
              AssetImage('assets/user.png'),
              size: 40,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              MyNavigate.navigatejustpush(Settings(), context);
            },
            child: Icon(
              Icons.settings,
              size: 33,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () async {
              var response = await AuthService().logout();
              snackBar(Login(), context, 'Logged out successfully');
            },
            child: Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
          ),
        ]);
  }
}
