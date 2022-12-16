// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
    super.key,
    required this.task,
  });

  final NurseTask task;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.dashboard_deleteTask.tr()),
      content: Text(
        '${LocaleKeys.dashboard_deleteConfirmation.tr()}: '
        '${task.title ?? ''}?',
      ),
      actions: [
        TextButton(
          onPressed: () => context.popRoute(false),
          child: Text(LocaleKeys.dashboard_cancel.tr()),
        ),
        TextButton(
          onPressed: () => context.popRoute(true),
          child: Text(LocaleKeys.dashboard_delete.tr()),
        ),
      ],
    );
  }
}
