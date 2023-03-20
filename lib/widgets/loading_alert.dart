import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

import '../constants/demis.dart';
import '../constants/strings.dart';
import 'easy_text.dart';

class LoadingAlertDialogWidget extends StatelessWidget {
  const LoadingAlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
           SizedBox(
            width: kSP20x,
          ),
          EasyText(
            text: kLoadingText,
            fontWeight: FontWeight.w500,
            fontSize: kFontSize18x,
            textColor: kBlack,
          )
        ],
      ),

    );
  }
}
