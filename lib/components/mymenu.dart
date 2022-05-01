

import 'package:smart_commando/actions_page.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import '../home_page.dart';
import '../profile.dart';

class MyMenu extends StatelessWidget {
  
  const MyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FabCircularMenu(
      fabOpenColor: myBrown,
      fabCloseColor: Colors.white,
      ringColor: myLightBrown,
      fabOpenIcon: ImageIcon(
                            AssetImage('assets/fabmenu.png'),
                              size: 90,
                              color:myBrown,
                            ),
      children:[            
        InkWell(onTap: (){
          MyNavigate.navigatepushuntil(HomePage(), context);
        },child: Icon(Icons.home,color: Colors.white,),),
        InkWell(onTap: (){},child: Icon(Icons.home,color: Colors.white,),),
        InkWell(onTap: (){
          MyNavigate.navigatejustpush(ActionsPage(user_id: 2), context);
        },
        child:ImageIcon(
                            AssetImage('assets/action.png'),
                              size: 50,
                              color:Colors.white,
                            ),
        ),
        InkWell(onTap: (){
            MyNavigate.navigatejustpush(Profile(), context);
        },child: ImageIcon(
                            AssetImage('assets/user.png'),
                              size: 50,
                              color:Colors.white,
                            ),),
        InkWell(onTap: (){},child: Icon(Icons.logout,color: Colors.white,),),
      ] );
  }
}