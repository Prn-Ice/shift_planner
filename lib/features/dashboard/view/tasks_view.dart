// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:shift_planner/gen/gen.dart';
import '../widgets/widgets.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key, required this.tasks});

  final Map<Shift?, List<NurseTask>> tasks;

  @override
  Widget build(BuildContext context) {
    final morningTasks = tasks[Shift.morning];
    final eveningTasks = tasks[Shift.evening];
    final nightTasks = tasks[Shift.night];

    return CustomScrollView(
      slivers: [
        if (morningTasks?.isNotEmpty ?? false)
          _TaskGroup(
            shift: Shift.morning,
            items: morningTasks!,
          ),
        if (eveningTasks?.isNotEmpty ?? false)
          _TaskGroup(
            shift: Shift.evening,
            items: eveningTasks!,
          ),
        if (nightTasks?.isNotEmpty ?? false)
          _TaskGroup(
            shift: Shift.night,
            items: nightTasks!,
          ),
      ],
    );
  }
}

class _TaskGroup extends StatelessWidget {
  const _TaskGroup({
    required this.shift,
    required this.items,
  });

  final Shift shift;
  final List<NurseTask> items;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 50.h,
        color: shift.color,
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        alignment: Alignment.centerLeft,
        child: Text(
          shift.name.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: items.length,
          (context, index) => _TaskTile(items[index]),
        ),
      ),
    );
  }
}

class _TaskTile extends ConsumerWidget {
  const _TaskTile(this.task);

  final NurseTask task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet<void>(
                context: context,
                builder: (context) => EditTaskBottomSheet(task: task),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: LocaleKeys.dashboard_edit.tr(),
          ),
          SlidableAction(
            onPressed: (context) async {
              final value = await showDialog<bool?>(
                context: context,
                builder: (context) => DeleteTaskDialog(task: task),
              );

              if (value ?? false) {
                ref.read(dashboardProvider.bloc).add(DashboardDeleteTask(task));
              }
            },
            backgroundColor: Theme.of(context).errorColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: LocaleKeys.dashboard_delete.tr(),
          ),
        ],
      ),
      child: CheckboxListTile(
        value: task.isComplete,
        title: Text(task.title ?? 'Title'),
        subtitle: Text(_formatDate(task.dueDate)),
        onChanged: (val) =>
            ref.read(dashboardProvider.bloc).add(DashboardToggleTask(task)),
      ),
    );
  }

  String _formatDate(DateTime? value) {
    final format = DateFormat('hh:mm aaa EEE, MMM d, ' 'yy');

    try {
      return format.format(value!);
    } catch (e) {
      return 'Date';
    }
  }
}
