
import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';

import 'gradient_text.dart';

class MyListContainer extends StatelessWidget {
  final String title;
  final titleColor;
  final subtitleColor;
  final String? sub_title;
  final String? smalltext;
  const MyListContainer({
    Key? key, required this.title, this.sub_title,this.smalltext,this.titleColor
    ,this.subtitleColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(19.0).copyWith(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                    title,
                    style: TextStyle(
                          color: titleColor ?? Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                    ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: size(context).width * 0.56,
            child: Wrap(
              children: [
                GradientText(
                          sub_title ?? 'Notes...',
                          gradient: LinearGradient(colors:subtitleColor==null?
                                             myBrownGradient: [subtitleColor,subtitleColor]),
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                          ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}