import 'package:flutter/material.dart';

import '../../constants/palette.dart';

class Txt extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;
  const Txt(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = Palette.black,
    this.fontFamily = 'Roboto',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
