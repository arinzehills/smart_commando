import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:smart_commando/dashboard.dart';
import 'package:smart_commando/home_page.dart';
import 'package:smart_commando/profile.dart';

class MyDrawer extends StatefulWidget {
  // final String uid;
  // final String name;
  // final String email;
  // final String phone;

  MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    //  var myred=Color(MyApp().myred);
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Container(
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(40).copyWith(left: 10, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      IconlyBold.close_square,
                    ),
                    color: myBrown,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 190,
                    child: Wrap(
                      children: [
                        Text(
                          'user.full_name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: myBrown,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildMenuItem(
              context: context, index: 0, title: 'Home', route: HomePage()),
          buildMenuItem(
              context: context,
              index: 1,
              isCustomRouting: true,
              route: Dashboard(),
              title: 'Polls'),
          buildMenuItem(
              context: context,
              isCustomRouting: true,
              index: 9,
              route: Profile(),
              title: 'Profile'),
          buildMenuItem(
              context: context,
              isCustomRouting: true,
              index: 9,
              route: Profile(),
              title: 'Actions'),
          MyButton(
              placeHolder: 'Logout',
              isOval: true,
              isGradientButton: true,
              gradientColors: myBrownGradient,
              pressed: () async {
                // await AuthService().logout();
                // var response = await AuthService().logout();
                // MyNavigate.navigatepushuntil(Login(), context);
                // if (response['success'] == true) {
                //   snackBar(Login(), context, 'Logged out successfully');
                // }
              })
        ]),
      ),
    );
  }

  Widget buildMenuItem({context, index, title, isCustomRouting, route}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.6, bottom: 0.9),
      child: ListTile(
        visualDensity: VisualDensity(vertical: 1),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: myBrown),
        ),
        // selected: _selectedIndex == index,
        // selectedColor: myBrown,
        tileColor: _selectedIndex == index ? myBrown : null,
        title: Center(
          child: GradientText(
            title ?? 'Library ',
            style: TextStyle(fontSize: 25),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _selectedIndex == index
                  ? [Colors.white, Colors.white]
                  : [myBrown, myLightBrown],
            ),
          ),
        ),
        onTap: () => {
          setState(() {
            _selectedIndex = index;
          }),
          MyNavigate.navigatepushuntil(route, context)
        },
        // selected: _selectedIndex == 5,
      ),
    );
  }
}
