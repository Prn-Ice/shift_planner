// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:shift_planner/gen/gen.dart';
import '../widgets/widgets.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(dashboardProvider.select((value) => value.status));

    return LoadingIndicator(
      isLoading: status == FormzStatus.submissionInProgress,
      child: AutoTabsScaffold(
        routes: const [
          TodayRoute(),
          AllRoute(),
          CompletedRoute(),
        ],
        appBarBuilder: (context, tabsRouter) {
          return AppBar(title: Text(_getTitle(tabsRouter.activeIndex)));
        },
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) => const NewTaskBottomSheet(),
            );
          },
        ),
        drawer: const _Drawer(),
        builder: (context, child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  String _getTitle(int activeIndex) {
    if (activeIndex == 0) return LocaleKeys.dashboard_today.tr();
    if (activeIndex == 1) return LocaleKeys.dashboard_all.tr();

    return LocaleKeys.dashboard_completed.tr();
  }
}

class _Drawer extends ConsumerWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dashboardProvider, (prev, next) {
      if (prev == next) return;

      if (next.status == FormzStatus.submissionFailure &&
          next.error.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(next.error),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    final user = ref.watch(dashboardProvider.select((value) => value.user));

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.appName.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
                8.verticalSpace,
                Text(
                  user?.email ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    onPressed: () => ref
                        .read(dashboardProvider.bloc)
                        .add(const DashboardLogout()),
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.today),
            title: Text(LocaleKeys.dashboard_today.tr()),
            onTap: () => context
              ..navigateTo(const TodayRoute())
              ..popRoute(),
          ),
          ListTile(
            leading: const Icon(Icons.all_inbox),
            title: Text(LocaleKeys.dashboard_all.tr()),
            onTap: () => context
              ..navigateTo(const AllRoute())
              ..popRoute(),
          ),
          ListTile(
            leading: const Icon(Icons.archive),
            title: Text(LocaleKeys.dashboard_completed.tr()),
            onTap: () => context
              ..navigateTo(const CompletedRoute())
              ..popRoute(),
          ),
        ],
      ),
    );
  }
}
