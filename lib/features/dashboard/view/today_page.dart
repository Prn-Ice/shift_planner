// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:shift_planner/features/dashboard/bloc/dashboard_bloc.dart';
import 'tasks_view.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(
      dashboardProvider
          .select((value) => value.tasksByDateGrouped(DateTime.now())),
    );

    return TasksView(tasks: tasks);
  }
}
