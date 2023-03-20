import 'package:todo/data/apply/task_apply.dart';
import 'package:todo/data/vos/task_vo.dart';
import 'package:todo/network/data_agent/clould_firestore_data_agent_impl.dart';
import 'package:todo/network/data_agent/task_data_agent.dart';

class TaskApplyImpl extends TaskApply {
  TaskApplyImpl._();

  static final TaskApplyImpl _singleton = TaskApplyImpl._();

  factory TaskApplyImpl() => _singleton;

  final TaskDataAgent _dataAgent = ClouldFirestoreDataAgentImpl();

  @override
  Stream<List<TaskVo>?> getTaskList() => _dataAgent.getTaskList();

  @override
  Future<void> addTask(TaskVo? taskVo, String title, String description,
      String note, String date, String time) {
    if (taskVo == null) {
      TaskVo task = TaskVo(DateTime.now().microsecondsSinceEpoch, title,
          description, note, date, time, false);
      return _dataAgent.addTask(task);
    }
    return _dataAgent.addTask(taskVo);
  }

  @override
  Future<void> deleteTask(int taskId) => _dataAgent.deleteTask(taskId);

  @override
  Future<TaskVo> getTaskBytaskId(int taskId) =>
      _dataAgent.getTaskBytaskId(taskId);
}
