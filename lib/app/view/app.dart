// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:auto_route_observer/auto_route_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';

class App extends StatelessWidget {
  App({super.key, AppRouter? router}) : _router = router ?? resolve();

  final AppRouter _router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerDelegate: _router.delegate(
          navigatorObservers: () => [
            AppRouteObserver(logger: getLogger('ROUTER')),
          ],
        ),
        routeInformationParser: _router.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ShiftPlannerTheme.theme(),
        darkTheme: ShiftPlannerTheme.theme(isDark: true),
        themeMode: ThemeMode.light,
        builder: (context, widget) {
          /// Prevent app from scaling with device font
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: widget ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
