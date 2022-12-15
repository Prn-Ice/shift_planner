// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class TimeInput extends StatefulWidget {
  const TimeInput({
    super.key,
    this.errorText,
    this.initial,
    required this.onChanged,
  });

  final String? errorText;
  final TimeOfDay? initial;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  State<TimeInput> createState() => _DateInputState();
}

class _DateInputState extends State<TimeInput> {
  TimeOfDay? time;
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

    time = widget.initial;
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
            time == null ? LocaleKeys.time.tr() : _formatDate,
            style: _getStyle,
          ),
        ),
      ),
    );
  }

  TextStyle? get _getStyle {
    final base = Theme.of(context).textTheme.subtitle1;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (time == null) {
      return base?.copyWith(
        color: isDark ? Colors.white60 : Colors.black.withOpacity(0.6),
      );
    }

    return base;
  }

  Future<void> _onSelectDate() async {
    final now = TimeOfDay.now();

    final value = await showTimePicker(
      context: context,
      initialTime: widget.initial ?? now,
    );

    setState(() {
      time = value ?? now;
      widget.onChanged(value ?? now);
    });
  }

  String get _formatDate {
    try {
      return time!.format(context);
    } catch (e) {
      return 'Date';
    }
  }
}
