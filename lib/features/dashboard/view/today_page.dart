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

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(
      dashboardProvider.select((value) => value.tasksGrouped(DateTime.now())),
    );

    return CustomScrollView(
      slivers: tasks.entries.map(
        (e) {
          return SliverStickyHeader(
            header: Container(
              height: 50.h,
              color: e.key.color,
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              alignment: Alignment.centerLeft,
              child: Text(
                e.key?.name.toUpperCase() ?? 'Title',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: e.value.length,
                (context, index) => _TaskTile(e.value[index]),
              ),
            ),
          );
        },
      ).toList(),
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
            onPressed: (context) {},
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: LocaleKeys.dashboard_edit.tr(),
          ),
          SlidableAction(
            onPressed: (context) {},
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
        onChanged: (val) {},
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
