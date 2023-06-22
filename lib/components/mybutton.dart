import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';

class MyButton extends StatelessWidget {
  String placeHolder;
  double? widthRatio;
  double? height;
  bool isOval;
  bool withBorder;
  bool isGradientButton;
  bool loadingState;
  List<Color>? gradientColors;
  Color? color;
  final VoidCallback pressed;
  Widget? child;

  double? fontSize;

  MyButton({
    required this.placeHolder,
    this.child,
    this.isOval = false,
    this.withBorder = false,
    this.height,
    this.fontSize,
    this.widthRatio,
    this.isGradientButton = false,
    this.loadingState = false,
    this.gradientColors,
    this.color,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loadingState ? null : pressed,
      style: ButtonStyle(
        // padding:
        shape: MaterialStateProperty.all(StadiumBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      // disabledColor: Colors.orange,
      // disabledTextColor: Colors.white,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(isOval ? 80.0 : 0.0)),
      child: Ink(
        width: MediaQuery.of(context).size.width * (widthRatio ?? 0.9),
        height: height ?? 55,
        decoration: BoxDecoration(
          color: color ?? myorange,
          border: withBorder ? Border.all(color: Colors.white) : null,
          gradient: isGradientButton
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.all(Radius.circular(isOval ? 30 : 8)),
        ),
        child: loadingState
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      placeHolder,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSize ?? 16),
                    ),
                    child ?? SizedBox(),
                  ],
                ),
              ),
      ),
    );
  }
}
