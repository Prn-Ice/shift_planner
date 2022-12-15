// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_task_request.freezed.dart';
part 'create_task_request.g.dart';

// **************************************************************************
// FreezerGenerator
// **************************************************************************

@freezed
class CreateTaskRequest with _$CreateTaskRequest {
  const factory CreateTaskRequest({
    String? title,
    DateTime? dueDate,
    String? shift,
  }) = _CreateTaskRequest;

  /// Returns [CreateTaskRequest] based on [json].
  factory CreateTaskRequest.fromJson(Map<String, Object?> json) =>
      _$CreateTaskRequestFromJson(json);
}
