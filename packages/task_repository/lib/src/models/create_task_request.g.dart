// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateTaskRequest _$$_CreateTaskRequestFromJson(Map<String, dynamic> json) =>
    _$_CreateTaskRequest(
      title: json['title'] as String?,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      shift: json['shift'] as String?,
    );

Map<String, dynamic> _$$_CreateTaskRequestToJson(
        _$_CreateTaskRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'due_date': instance.dueDate?.toIso8601String(),
      'shift': instance.shift,
    };
