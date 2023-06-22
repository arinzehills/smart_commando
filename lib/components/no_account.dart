import 'package:flutter/material.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/constants/constant.dart';

class NoAccount extends StatelessWidget {
  String title;
  String? subtitle;
  Function()? pressed;
  NoAccount({required this.title, this.pressed, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,
              style: TextStyle(
                  color: Color.fromARGB(222, 0, 0, 0),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          GradientText(subtitle ?? '',
              style: const TextStyle(fontSize: 18),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.bottomRight,
                colors: myBrownGradient,
              ))
        ],
      ),
    );
  }
}
