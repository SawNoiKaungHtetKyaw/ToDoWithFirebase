import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/data/vos/task_vo.dart';
import 'package:todo/network/data_agent/task_data_agent.dart';

class ClouldFirestoreDataAgentImpl extends TaskDataAgent {
  ClouldFirestoreDataAgentImpl._();

  static final ClouldFirestoreDataAgentImpl _singleton =
      ClouldFirestoreDataAgentImpl._();

  factory ClouldFirestoreDataAgentImpl() => _singleton;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<TaskVo>?> getTaskList() => _firebaseFirestore
          .collection(kRootNodeForTask)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((document) {
          return TaskVo.fromJson(document.data());
        }).toList();
      });

  @override
  Future<void> addTask(TaskVo taskVo) => _firebaseFirestore
      .collection(kRootNodeForTask)
      .doc(taskVo.id.toString())
      .set(taskVo.toJson());

  @override
  Future<void> deleteTask(int taskId) => _firebaseFirestore
      .collection(kRootNodeForTask)
      .doc(taskId.toString())
      .delete();

  @override
  Future<TaskVo> getTaskBytaskId(int taskId) => _firebaseFirestore
      .collection(kRootNodeForTask)
      .doc(taskId.toString())
      .get()
      .asStream()
      .map((documetSnapshot) => TaskVo.fromJson(documetSnapshot.data() ?? {}))
      .first;
}
