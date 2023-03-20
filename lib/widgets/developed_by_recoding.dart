import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/widgets/easy_text.dart';

class DevelopedByReCoding extends StatelessWidget {
  const DevelopedByReCoding({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyText(
      text: kDevByReCoding,
      textColor: kHintTxtColor,
      fontWeight: FontWeight.bold,
    );
  }
}
