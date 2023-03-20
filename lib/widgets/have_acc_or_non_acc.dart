import 'package:flutter/material.dart';
import 'package:todo/widgets/easy_text.dart';

import '../constants/colors.dart';

class HaveAccOrNonAcc extends StatelessWidget {
  const HaveAccOrNonAcc(
      {super.key,
      required this.haveOrNotAcc,
      required this.registerOrLogin,
      required this.onTap});
  final String haveOrNotAcc, registerOrLogin;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyText(
          text: haveOrNotAcc,
          fontWeight: FontWeight.w500,
        ),
        GestureDetector(
            onTap: () => onTap(),
            child: EasyText(
              text: registerOrLogin,
              fontWeight: FontWeight.w500,
              textColor: kPrimaryColor,
            )),
      ],
    );
    // return RichText(
    //     text: TextSpan(children: [
    //   TextSpan(
    //       text: haveOrNotAcc,
    //       style: const TextStyle(color: kBlack, fontWeight: FontWeight.w500)),
    //   TextSpan(
    //     onEnter: ,
    //       text: registerOrLogin,
    //       style: const  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500))
    // ]));
  }
}
