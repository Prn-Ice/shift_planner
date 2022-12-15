// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Flutter imports:
import 'package:flutter/material.dart' as _i7;

// Package imports:
import 'package:auto_route/auto_route.dart' as _i6;

// Project imports:
import '../../features/counter/counter.dart' as _i5;
import '../../features/dashboard/dashboard.dart' as _i4;
import '../../features/login/login.dart' as _i2;
import '../../features/register/register.dart' as _i3;
import '../../features/splash/splash.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.CustomPage<void>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.CustomPage<void>(
        routeData: routeData,
        child: const _i2.LoginPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.CustomPage<void>(
        routeData: routeData,
        child: const _i3.RegisterPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.CustomPage<void>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CounterRoute.name: (routeData) {
      return _i6.CustomPage<void>(
        routeData: routeData,
        child: const _i5.CounterPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i6.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
        ),
        _i6.RouteConfig(
          CounterRoute.name,
          path: '/counter-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute()
      : super(
          CounterRoute.name,
          path: '/counter-page',
        );

  static const String name = 'CounterRoute';
}
