// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class DateInput extends StatefulWidget {
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
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? date;
  bool isFocused = false;
  late FocusNode focusNode;

  void _focusListener() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();

    date = widget.initial;
    focusNode = FocusNode();
    focusNode.addListener(_focusListener);
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(_focusListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelectDate,
      child: InputDecorator(
        isFocused: focusNode.hasFocus,
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range),
        ),
        child: Focus(
          focusNode: focusNode,
          child: Text(
            date == null ? LocaleKeys.date.tr() : _formatDate,
            style: _getStyle,
          ),
        ),
      ),
    );
  }

  TextStyle? get _getStyle {
    final base = Theme.of(context).textTheme.subtitle1;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (date == null) {
      return base?.copyWith(
        color: isDark ? Colors.white60 : Colors.black.withOpacity(0.6),
      );
    }

    return base;
  }

  Future<void> _onSelectDate() async {
    final now = DateTime.now();

    final value = await showDatePicker(
      context: context,
      initialDate: widget.initial ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );

    setState(() {
      date = value ?? now;
      widget.onChanged(value ?? now);
    });
  }

  String get _formatDate {
    final format = DateFormat('EEE, MMM d, ' 'yy');

    try {
      return format.format(date!);
    } catch (e) {
      return 'Date';
    }
  }
}
