import 'package:json_annotation/json_annotation.dart';
part 'task_vo.g.dart';

@JsonSerializable()
class TaskVo {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'time')
  String? time;

  @JsonKey(name: 'is_checked')
  bool? isChecked;

  TaskVo(
      this.id, this.title, this.description, this.note, this.date, this.time , this.isChecked);

  factory TaskVo.fromJson(Map<String, dynamic> json) => _$TaskVoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskVoToJson(this);
}
