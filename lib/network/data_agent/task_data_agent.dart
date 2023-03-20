import '../../data/vos/task_vo.dart';

abstract class TaskDataAgent {
  Stream<List<TaskVo>?> getTaskList();
  Future<void> addTask(TaskVo taskVo);
  Future<void> deleteTask(int taskId);
  Future<TaskVo> getTaskBytaskId(int taskId);
}
