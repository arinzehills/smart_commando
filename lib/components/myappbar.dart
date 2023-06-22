import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:smart_commando/profile.dart';

class MyAppMenuBar extends StatelessWidget with PreferredSizeWidget {
  MyAppMenuBar({
    Key? key,
    required this.title,
    this.imageUrl,
    this.showRightIcons = true,
  }) : super(key: key);

  final String title;
  bool showRightIcons;
  String? imageUrl;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    bool? showDrawer;

    return AppBar(
      centerTitle: title != 'Home' ? false : true,
      title: title != 'Home'
          ? Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          : Image.asset(
              'assets/logo.png',
              height: 200,
              width: 200,
            ),
      backgroundColor: mypink.withOpacity(0.22),
      shadowColor: Colors.transparent,
      leading: Container(
        padding: EdgeInsets.only(left: 13),
        height: 10,
        width: 10,
        child: showDrawer == null
            ? IconButton(
                onPressed: () => {
                  if (imageUrl == null)
                    {Scaffold.of(context).openDrawer()}
                  else
                    {Navigator.pop(context)}
                },
                icon: SvgPicture.asset(
                    imageUrl == null ? 'assets/svg/menuicon.svg' : imageUrl!,
                    // height: 100,
                    // fit: BoxFit.fill,
                    color: Colors.white,
                    semanticsLabel: 'A red up arrow'),
              )
            : SizedBox(),
      ),
      actions: !showRightIcons
          ? []
          : [
              Container(
                padding: EdgeInsets.only(right: 20),
                height: 33,
                // width: 33,
                child: Center(
                  child: new Stack(
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () =>
                                MyNavigate.navigatejustpush(Profile(), context),
                            child: SvgPicture.asset(
                                'assets/svg/profileicon.svg',
                                height: 22,
                                width: 22,
                                color: iconsColor,
                                // color: Color.fromARGB(255, 201, 199, 199),
                                semanticsLabel: 'A red up arrow'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
    );
  }
}
