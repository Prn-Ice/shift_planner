// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class ShiftDropDown extends StatelessWidget {
  const ShiftDropDown({
    super.key,
    this.initial,
    this.errorText,
    required this.onChanged,
  });

  final Shift? initial;
  final String? errorText;
  final ValueChanged<Shift?> onChanged;

  @override
  Widget build(BuildContext context) {
    final items = [Shift.morning, Shift.evening, Shift.night];

    return DropdownButtonFormField<Shift>(
      decoration: InputDecoration(
        icon: const Icon(Icons.filter_tilt_shift),
        hintText: LocaleKeys.dashboard_shift.tr(),
      ),
      value: initial,
      items: items
          .map(
            (e) => DropdownMenuItem<Shift>(
              value: e,
              child: Text(e.name.toUpperCase()),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
