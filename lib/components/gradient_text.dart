import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child:
          Text(text, overflow: overflow ?? TextOverflow.ellipsis, style: style),
    );
  }
}
