import 'package:flutter/material.dart';

myPopUp(context, heading, Widget? children) {
  int count = 0;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        height: 234,
        child: Center(
          child: Column(
            children: [
              //             Ink(
              //   decoration: const ShapeDecoration(
              //     color: Colors.blue,
              //     shape: CircleBorder(),
              //   ),
              //   child: ImageIcon(
              //                     AssetImage('assets/logo_transparent.png'),
              //                       size: 58,
              //                       color: Colors.white,
              //                     ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0, top: 9),
                child: Text(
                  heading,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              children!,
            ],
          ),
        ),
      ),
    ),
  );
}
