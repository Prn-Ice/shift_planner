// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:freezed_annotation/freezed_annotation.dart';

import 'shift.dart';

part 'nurse_task.freezed.dart';
part 'nurse_task.g.dart';

// **************************************************************************
// FreezerGenerator
// **************************************************************************

@freezed
class NurseTask with _$NurseTask {
  const factory NurseTask({
    String? title,
    bool? isComplete,
    DateTime? dueDate,
    Shift? shift,
  }) = _NurseTask;

  /// Returns [NurseTask] based on [json].
  factory NurseTask.fromJson(Map<String, Object?> json) =>
      _$NurseTaskFromJson(json);
}
