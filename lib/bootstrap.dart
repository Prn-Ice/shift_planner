// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// Dart imports:
import 'dart:async';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:bloc_logger/bloc_logger.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_logger/riverpod_logger.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

// Project imports:
import 'package:shift_planner/gen/gen.dart';
import 'app/app.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  String environment = Environment.dev,
  Future<void> Function()? firebaseInitializer,
}) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await firebaseInitializer?.call();

  // setup GetIt
  configureDependencies(environment: environment);

  // Keep splash open
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Prevent rotating screen
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // initialize localization
  await EasyLocalization.ensureInitialized();

  // setup logger
  final blocLogger = getLogger('BLOC', usePrettyPrinter: true);
  final globalLogger = getLogger('GLOBAL');
  final riverpodLogger = getLogger('RIVERPOD', usePrettyPrinter: true);

  // NOTE: would prefer this as a parameter of method
  final CrashlyticsService crashlyticsService = resolve();

  // display logs with global logger, send logs to crashlytics
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;

    return stack;
  };

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    crashlyticsService.recordFlutterFatalError(details);
    globalLogger.e(
      details.exceptionAsString(),
      details.exception,
      details.stack,
    );
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    crashlyticsService.recordError(error, stack);
    globalLogger.e('PlatformDispatcher', error, stack);

    return true;
  };

  // stop verbose easy_localization logs
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning,
  ];

  // setup bloc observer
  Bloc.observer = LoggerBlocObserver(logger: blocLogger);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: ProviderScope(
        observers: [
          RiverpodLogger(
            logger: riverpodLogger,
            crashlyticsService: crashlyticsService,
          ),
        ],
        child: await builder(),
      ),
    ),
  );
}
