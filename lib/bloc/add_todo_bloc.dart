import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/data/apply/task_apply.dart';
import 'package:todo/data/apply/task_apply_impl.dart';
import 'package:todo/data/vos/task_vo.dart';

class AddTodoBloc extends ChangeNotifier {
  bool _dispose = false;
  TaskVo? _taskVo;
  String _title = '';
  String _description = '';
  String _note = '';
  String _date = '';
  String _time = '';

  ////Getter
  bool get isDispose => _dispose;
  String get getTitle => _title;
  String get getDescription => _description;
  String get getNote => _note;
  String get getDate => _date;
  String get getTime => _time;
  TaskVo? get getTaskVo => _taskVo;

  ////Setter
  void setTitle(String title) => _title = title;
  void setDescription(String description) => _description = description;
  void setNote(String note) => _note = note;

  //state instance
  final TaskApply _taskApply = TaskApplyImpl();

  AddTodoBloc(int taskId) {
    if (taskId != -1) {
      _taskApply.getTaskBytaskId(taskId).then((value) {
        _taskVo = value;
        _title = value.title ?? '';
        _description = value.description ?? '';
        _note = value.note ?? '';
        _date = value.date ?? '';
        _time = value.time ?? '';
        notifyListeners();
      });
    }
  }

  Future onTapAddNewTask() {
    if (_taskVo != null) {
      
      _taskVo?.title = _title;
      _taskVo?.description = _description;
      _taskVo?.note = _note;
      _taskVo?.date = _date;
      _taskVo?.time = _time;
    }
    if (_date == '') {
        getDateMethod(DateTime.now());
      }
      if (_time == '') {
        getTimeMethod(TimeOfDay.now());
      }
    return _taskApply.addTask(
        _taskVo, _title, _description, _note, _date, _time);
  }

  getDateMethod(DateTime picker) {
    //Formatter with intl package
    final DateFormat formatter = DateFormat('yyyy/MMMM/dd');

    //date format
    final String date = formatter.format(picker);

    _date = date;

    notifyListeners();
  }

  getTimeMethod(TimeOfDay picker) {
    //Change TimeOfDay to DateTime
    DateTime dateTimeOfDay = DateTime(0, 0, 0, picker.hour, picker.minute);

    //Formatter with intl package
    final DateFormat formatter = DateFormat('h:m a');

    //Time Fomart
    final String time = formatter.format(dateTimeOfDay);

    _time = time;

    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
