import 'package:flutter/material.dart';
import 'package:smart_commando/constants/my_navigate.dart';

// final generalUrl = "http://localhost:3000";
// final generalUrl = "http://10.0.2.2:3000";
final generalUrl = "https://smart-commando.cyclic.app";
const appId = "0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
final iconsColor = const Color(0xffffffff);
final myLightBrown = const Color(0xffff4f5a);
final myDarkBrown = const Color(0xffA02D34);
final myBrown = const Color(0xffff606A);
final forminputPurple = const Color(0xff900fff);
final myorange = const Color.fromARGB(255, 252, 190, 6);
final mypink = const Color.fromARGB(255, 255, 4, 255);
final myPinkGradient = [myorange, mypink];
final myBrownGradient = [const Color(0xffff606A), const Color(0xffff4f5a)];
Size size(context) => MediaQuery.of(context).size;
var textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(20),
  // labelText: 'Even Densed TextFiled',
  // isDense: true,

  hintStyle: TextStyle(color: const Color(0xff626262)),
  filled: true,
  fillColor: const Color(0xfff7f7f7),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30.0),
  ),
);
//snackbar
snackBar(page, context, text) {
  MyNavigate.navigatejustpush(page, context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: mypink,
      content: Text(text ?? 'Logged In Successfully')));
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 50.0,
          spreadRadius: 2.0,
        ),
      ]);
}
