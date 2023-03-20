import 'package:flutter/material.dart';
import 'package:todo/widgets/easy_text.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';

class EasyTextField extends StatelessWidget {
  const EasyTextField(
      {super.key,
      required this.controller,
      required this.lableText,
      this.isObscure = false,
      required this.validate,
      this.maxLines = 1});
  final TextEditingController controller;
  final String lableText;
  final bool isObscure;
  final Function(String? value) validate;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      cursorColor: kPrimaryColor,
      validator: (value) => validate(value),
      maxLines: maxLines,
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
