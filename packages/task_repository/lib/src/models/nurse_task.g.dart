// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nurse_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NurseTask _$$_NurseTaskFromJson(Map<String, dynamic> json) => _$_NurseTask(
      title: json['title'] as String?,
      isComplete: json['is_complete'] as bool?,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      shift: $enumDecodeNullable(_$ShiftEnumMap, json['shift']),
    );

Map<String, dynamic> _$$_NurseTaskToJson(_$_NurseTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'is_complete': instance.isComplete,
      'due_date': instance.dueDate?.toIso8601String(),
      'shift': _$ShiftEnumMap[instance.shift],
    };

const _$ShiftEnumMap = {
  Shift.morning: 'morning',
  Shift.evening: 'evening',
  Shift.night: 'night',
};
