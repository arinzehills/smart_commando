import 'package:flutter/material.dart';


class MyOvalGradientButton extends StatelessWidget {
  String placeHolder;
  final VoidCallback pressed;
  final  firstcolor;
  final  secondcolor;
  double? height;
  double? width;
  Widget? child;
  MyOvalGradientButton({
    required this.placeHolder,
     required this.pressed,
    required this.firstcolor,
    required this.secondcolor,
    this.height,
    this.width,
    this.child,
  });
  

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
                                  onPressed:pressed,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                    padding: const EdgeInsets.all(0.0),
                                  child: Ink(
                                    width:width ?? MediaQuery.of(context).size.width* 0.4,
                                    height: height ?? 50,
                                  decoration:BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.white
                                    // ),
                                    gradient: LinearGradient(
                                     colors: [ firstcolor,secondcolor],
                                       begin: Alignment.topLeft,
                                     end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                   child: Container(
                                      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 16.0), // min sizes for Material buttons
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            placeHolder,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                            color:Colors.white,
                                            fontSize: 16
                                          ),
                                          ),
                                          child ?? SizedBox(),                                         
                                        ],
                                      ),
                                    ),
                                  ),

    );
  }
}