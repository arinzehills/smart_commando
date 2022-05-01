import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class MyNavigate  {
  
     static  navigatepushuntil(Widget page,BuildContext context){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                page), (Route<dynamic> route) => false);
    // (context,
  
    //                 MaterialPageRoute(builder: (context) => page));
  }
    static  navigatejustpush(Widget page ,BuildContext context){
    Navigator.push(context,
  
                    MaterialPageRoute(builder: (context) => page));
  }
      static  navigateandreplace(Widget page ,BuildContext context){
    Navigator.pushReplacement(context,
  
                    MaterialPageRoute(builder: (context) => page));
  }
  static  navigateuntil(Widget page ,BuildContext context){
    Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (context) =>
                                              page),
                                               (Route<dynamic> route) => false);
  }
  // @override
  // Widget build(BuildContext context) {

  //   return Container(
  //       color: Colors.white,
  //       child: Center(
  //         child:  SpinKitChasingDots(
  //           color: Colors.white,
  //           size: 50.0,
  //          ),
  //       ),
  //   );
  // }
}