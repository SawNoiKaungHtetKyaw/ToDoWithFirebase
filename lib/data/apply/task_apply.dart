import '../vos/task_vo.dart';

abstract class TaskApply{
  
  Stream<List<TaskVo>?> getTaskList();

  Future<void> addTask(TaskVo? taskVo,String title ,String description,String note,String date,String time);

  Future<void> deleteTask(int taskId);

  Future<TaskVo> getTaskBytaskId(int taskId);
}