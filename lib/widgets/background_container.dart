import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: kBackgroundContainerHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            kPrimaryColor,
            kSecondyColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kSP50x),
              bottomRight: Radius.circular(kSP50x)),
          boxShadow: [
            BoxShadow(spreadRadius: 0.9, blurRadius: 0.8, color: kShadowColor)
          ]),
    );
  }
}
