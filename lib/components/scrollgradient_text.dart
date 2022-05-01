import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
class ScrollGradientText extends StatelessWidget {
  const ScrollGradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: SizedBox(
              height: 50,
              width: 10,
              child: Container(
                width: 10,
                child: Marquee(
                                          text:text,
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white
                                          ),
                                          scrollAxis: Axis.horizontal,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          blankSpace: 20.0,
                                          velocity: 100.0,
                                          pauseAfterRound: Duration(seconds: 3),
                                          startPadding: 0.0,
                                          accelerationDuration: Duration(seconds: 1),
                                          accelerationCurve: Curves.linear,
                                          decelerationDuration: Duration(milliseconds: 500),
                                          decelerationCurve: Curves.easeOut,
                                        ),
              ),
              ),
    );
  }
}