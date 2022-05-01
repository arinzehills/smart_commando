import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';


class MyCurveContainer extends StatelessWidget {
  String? pagetitle;
  Widget? curvecontainerwidget1;
  Widget? curvecontainerwidget2;
  Widget? right_widget;
  String? searchHint;
  bool? showLogo;
  final double height;
 MyCurveContainer({
    Key? key,
    required this.size,
    this.pagetitle,
    this.curvecontainerwidget1,
    this.right_widget,
    this.searchHint,
    required this.height,
    this.curvecontainerwidget2,
    this.showLogo,
    
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 0),
    decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: myBrownGradient
                    ),
                    boxShadow: [
                                BoxShadow(
                                  color: myLightBrown.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                  offset: Offset(0,30)
                                )
                              ]
               ),
               child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     mainAxisAlignment: MainAxisAlignment.start,                     
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top:5.0,left: 20),
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            //  IconButton(
                            //   onPressed: ()=> {
                            //   Scaffold.of(context).openDrawer()
                            //     }, 
                            //             icon: ImageIcon(
                            //     AssetImage('assets/menu.png'),
                            //       size: 90,
                            //       color:myOrange,
                            //     ),
                            //  ),
                          showLogo==true?     Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 55,
                                  child:
                                    Image.asset('assets/logo1.png',)
                              ):
                                     Text(
                                      pagetitle ?? '',
                                      style: TextStyle(
                                        color: myBrown,
                                        fontSize: 22,
                                      ),
                                      textAlign:TextAlign.left ,
                             ),
                              right_widget!=null ? SizedBox(width: 150,): SizedBox(),
                              right_widget ?? SizedBox(),
                             Spacer(),       //      
                        ],
                         ),
                       ),
                       SizedBox(
                     height: 0,
                       ),
                       
                             curvecontainerwidget1 ?? SizedBox(),
                      //  showSearchButton==true  ? 
                                 curvecontainerwidget2 ?? SizedBox(),
                     ]
                 ),
               
    );
  }
}