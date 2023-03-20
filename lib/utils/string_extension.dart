import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String getDate() {
    //Formatter with intl package
    final DateFormat formatter = DateFormat('yyyy/MMMM/dd');

    //date format
    final String date = formatter.format(this);

    return date;
  }
}

extension StringExtension on String {
  String getTaskOrTasks() {
    int task = int.parse(this);
    return (task > 1) ? "$task Tasks" : "$task Task";
  }
}
