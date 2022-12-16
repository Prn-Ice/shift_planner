// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../bloc/dashboard_bloc.dart';
import '../dashboard.dart';

class AllPage extends ConsumerWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(
      dashboardProvider.select((value) => value.allTasksGrouped),
    );

    return TasksView(tasks: tasks);
  }
}
