import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import 'easy_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
          width: double.maxFinite,
          height: kCustomButtonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                kPrimaryColor,
                kSecondyColor,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(kSP5x),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 0.7,
                    blurRadius: 0.9,
                    offset: Offset(0.5, 1),
                    color: kShadowColor)
              ]),
          child:  EasyText(
            text: text,
            fontSize: kFontSize18x,
            fontWeight: FontWeight.bold,
            textColor: kWhite,
          )),
    );
  }
}
