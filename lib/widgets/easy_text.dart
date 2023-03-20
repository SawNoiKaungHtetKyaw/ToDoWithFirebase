import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

import '../constants/demis.dart';

class EasyText extends StatelessWidget {
  const EasyText(
      {Key? key,
      required this.text,
      this.fontSize = kFontSize14x,
      this.textColor = kBlack,
      this.overflow = TextOverflow.ellipsis,
      this.decoration = TextDecoration.none,
      this.fontWeight = FontWeight.w400,
      this.maxLine})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final int? maxLine;
  final TextDecoration decoration;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          decoration: decoration),
    );
  }
}
