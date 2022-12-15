// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:task_repository/task_repository.dart';

// ignore:prefer-match-file-name
extension ShiftExtensions on Shift? {
  Color get color {
    switch (this) {
      case Shift.morning:
        return const Color(0xFFda8682);
      case Shift.evening:
        return const Color(0xFF825370);
      case Shift.night:
      case null:
        return const Color(0xFF241949);
    }
  }
}

extension TimeOfDayExtensions on TimeOfDay? {
  String get toIso8601String {
    try {
      final asDate = DateTime(0, 0, 0, this!.hour, this!.minute);

      return asDate.toIso8601String();
    } catch (e) {
      return DateTime.now().toString();
    }
  }
}
