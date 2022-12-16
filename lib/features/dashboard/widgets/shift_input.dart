// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class ShiftInput extends StatefulWidget {
  const ShiftInput({
    super.key,
    this.value,
  });

  final Shift? value;

  @override
  State<ShiftInput> createState() => _DateInputState();
}

class _DateInputState extends State<ShiftInput> {
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
    return InputDecorator(
      isFocused: focusNode.hasFocus,
      decoration: const InputDecoration(
        icon:  Icon(Icons.filter_tilt_shift),
      ),
      child: Focus(
        focusNode: focusNode,
        child: Text(
          widget.value == null
              ? LocaleKeys.dashboard_shift.tr()
              : widget.value?.name.toUpperCase() ??
                  LocaleKeys.dashboard_shift.tr(),
          style: _getStyle,
        ),
      ),
    );
  }

  TextStyle? get _getStyle {
    final base = Theme.of(context).textTheme.subtitle1;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (widget.value == null) {
      return base?.copyWith(
        color: isDark ? Colors.white60 : Colors.black.withOpacity(0.6),
      );
    }

    return base;
  }
}
