// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskVo _$TaskVoFromJson(Map<String, dynamic> json) => TaskVo(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['note'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['is_checked'] as bool?,
    );

Map<String, dynamic> _$TaskVoToJson(TaskVo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'note': instance.note,
      'date': instance.date,
      'time': instance.time,
      'is_checked': instance.isChecked,
    };
