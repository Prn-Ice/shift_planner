// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:freezed_annotation/freezed_annotation.dart';

import 'nurse_task.dart';

part 'nurse_tasks.freezed.dart';
part 'nurse_tasks.g.dart';

// **************************************************************************
// FreezerGenerator
// **************************************************************************

@freezed
class NurseTasks with _$NurseTasks {
  const factory NurseTasks({
    List<NurseTask>? tasks,
  }) = _NurseTasks;

  /// Returns [NurseTasks] based on [json].
  factory NurseTasks.fromJson(Map<String, Object?> json) =>
      _$NurseTasksFromJson(json);
}
