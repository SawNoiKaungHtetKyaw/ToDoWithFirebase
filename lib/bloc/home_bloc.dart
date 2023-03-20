
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/data/vos/task_vo.dart';

import '../data/apply/task_apply.dart';
import '../data/apply/task_apply_impl.dart';

class HomeBloc extends ChangeNotifier {
  bool _dispose = false;
  List<TaskVo> _taskVoList = [];

  ////Getter
  bool get isDispose => _dispose;
  List<TaskVo> get getTaskList => _taskVoList;

  //state instance
  final TaskApply _taskApply = TaskApplyImpl();

  HomeBloc() {
    _taskApply.getTaskList().listen((event) {
      _taskVoList = event ?? [];
      notifyListeners();
    });
  }

  deleteTaskById(int taskId) {
    _taskApply.deleteTask(taskId);
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
