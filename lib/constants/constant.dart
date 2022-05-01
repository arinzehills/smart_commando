
import 'package:flutter/material.dart';


const  appId="0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
final iconsColor=const Color(0xffffffff);
final myLightBrown= const Color(0xffff4f5a);
final myDarkBrown= const Color(0xffA02D34);
final myBrown= const Color(0xffff606A);
final forminputPurple= const Color(0xff900fff);

final myBrownGradient= [const Color(0xffff606A),const Color(0xffff4f5a)];
 Size size(context)=> MediaQuery.of(context).size;
var textFieldDecoration = InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    // labelText: 'Even Densed TextFiled',
                                    // isDense: true,
                                   hintStyle: TextStyle(
                                     color:const  Color(0xff626262)),
                                  filled: true,
                                  fillColor:const  Color(0xfff7f7f7),
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