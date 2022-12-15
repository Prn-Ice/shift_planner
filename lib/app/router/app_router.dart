// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:shift_planner/features/counter/counter.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.fadeIn,
  routes: <AutoRoute>[
    AutoRoute<void>(page: CounterPage),
  ],
)
class $AppRouter {}
