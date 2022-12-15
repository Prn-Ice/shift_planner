// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nurse_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NurseTasks _$$_NurseTasksFromJson(Map<String, dynamic> json) =>
    _$_NurseTasks(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => NurseTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NurseTasksToJson(_$_NurseTasks instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
