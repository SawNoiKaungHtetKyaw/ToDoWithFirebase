import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import 'easy_text.dart';

class DateAndTimePickerItemView extends StatelessWidget {
  const DateAndTimePickerItemView(
      {super.key,
      required this.title,
      required this.dateOrTime,
      required this.icon,
      required this.onTap});
  final String title, dateOrTime;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(kSP5x),
            border: Border.all(color: kTxtFieldBorderColor)),
        padding:
            const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP15x),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                EasyText(
                  text: title,
                  textColor: kHintTxtColor,
                  fontWeight: FontWeight.bold,
                ),
                EasyText(
                  text: dateOrTime,
                  textColor: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Icon(
              icon,
              color: kHintTxtColor,
            )
          ],
        ),
      ),
    );
  }
}

Future<DateTime?> getDatePicker(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(), //get today's date
    firstDate:
        DateTime(2000), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kPrimaryColor,
            onPrimary: kWhite,
            onSurface: kBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kPrimaryColor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}

Future<TimeOfDay?> getTimePicker(BuildContext context) {
  return showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kPrimaryColor,
            onPrimary: kWhite,
            onSurface: kBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kPrimaryColor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}
