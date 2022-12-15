// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class DateInput extends HookWidget {
  const DateInput({
    super.key,
    this.errorText,
    this.initial,
    required this.onChanged,
  });

  final String? errorText;
  final DateTime? initial;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final date = useState(initial);

    return GestureDetector(
      onTap: () => _onSelectDate(context, date),
      child: InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range),
        ),
        child: Text(
          date.value == null ? LocaleKeys.date.tr() : _formatDate(date.value),
          style: _getStyle(context, date),
        ),
      ),
    );
  }

  TextStyle? _getStyle(BuildContext context, ValueNotifier<DateTime?> date) {
    final base = Theme.of(context).textTheme.subtitle1;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (date.value == null) {
      return base?.copyWith(
        color: isDark ? Colors.white60 : Colors.black.withOpacity(0.6),
      );
    }

    return base;
  }

  Future<void> _onSelectDate(
    BuildContext context,
    ValueNotifier<DateTime?> date,
  ) async {
    final now = DateTime.now();

    final value = await showDatePicker(
      context: context,
      initialDate: initial ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );

    date.value = value ?? now;
    onChanged(value ?? now);
  }

  String _formatDate(DateTime? value) {
    final format = DateFormat('EEE, MMM d, ' 'yy');

    try {
      return format.format(value!);
    } catch (e) {
      return 'Date';
    }
  }
}
