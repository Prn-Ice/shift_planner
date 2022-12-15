// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:shift_planner/features/counter/counter.dart';
import 'package:shift_planner/features/dashboard/dashboard.dart';
import 'package:shift_planner/features/login/login.dart';
import 'package:shift_planner/features/register/register.dart';
import 'package:shift_planner/features/splash/splash.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.fadeIn,
  routes: <AutoRoute>[
    AutoRoute<void>(page: SplashPage, initial: true),
    AutoRoute<void>(page: LoginPage),
    AutoRoute<void>(page: RegisterPage),
    AutoRoute<void>(page: DashboardPage),
    AutoRoute<void>(page: CounterPage),
  ],
)
class $AppRouter {}
