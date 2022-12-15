// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/features/dashboard/bloc/dashboard_bloc.dart';

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
                (context, index) {
                  {
                    final item = e.value[index];

                    return CheckboxListTile(
                      value: item.isComplete,
                      title: Text(item.title ?? 'Title'),
                      subtitle: Text(_formatDate(item.dueDate)),
                      onChanged: (val) {},
                    );
                  }
                },
              ),
            ),
          );
        },
      ).toList(),
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
