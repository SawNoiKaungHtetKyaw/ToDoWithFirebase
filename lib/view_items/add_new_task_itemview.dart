import 'package:flutter/material.dart';
import 'package:todo/data/vos/task_vo.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import '../constants/strings.dart';
import '../widgets/easy_text.dart';

class AddNewTaskItemView extends StatelessWidget {
  const AddNewTaskItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: kAddNewTaskAppBarHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        kPrimaryColor,
        kSecondyColor,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: kWhite,
                    )),
                const EasyText(
                  text: kAddNewTask,
                  textColor: kWhite,
                  fontSize: kFontSize18x,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: kSP20x,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField(
      {super.key,
      required this.lableText,
      this.isObscure = false,
      required this.validate,
      this.maxLines = 1,
      required this.data,
      required this.onChanged});
  final String lableText;
  final bool isObscure;
  final Function(String? value) validate;
  final int maxLines;
  final String data;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: (data != null)
          ? TextEditingController(text: data)
          : null,
      obscureText: isObscure,
      cursorColor: kPrimaryColor,
      validator: (value) => validate(value),
      maxLines: maxLines,
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          label: EasyText(
            text: lableText,
            textColor: kHintTxtColor,
            fontWeight: FontWeight.bold,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP5x),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP5x),
              borderSide: const BorderSide(color: kTxtFieldBorderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP5x),
              borderSide: const BorderSide(color: kErrorColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP5x),
              borderSide: const BorderSide(color: kErrorColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP5x),
              borderSide: const BorderSide(color: kTxtFieldBorderColor))),
    );
  }
}
