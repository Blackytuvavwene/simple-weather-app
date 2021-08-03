import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.gradient})
      : super(key: key);

  final Gradient? gradient;
  final double fontSize;
  final text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(
          0,
          0,
          bounds.width,
          bounds.height,
        ),
      ),
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = Colors.indigo,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
