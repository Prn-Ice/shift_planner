// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:logger/logger.dart';
import 'package:platform_info/platform_info.dart';

const bool _isReleaseMode = bool.fromEnvironment('dart.vm.product');

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter(
    this.className, {
    this.printCallingFunctionName = true,
    this.printCallStack = false,
    this.excludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> excludeLogsFromClasses;
  final String? showOnlyClass;

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final methodName = _getMethodName();

    final methodNameSection =
        printCallingFunctionName && methodName != null ? ' | $methodName ' : '';
    final stackLog = event.stackTrace.toString();
    final callStack = printCallStack ? '\nSTACKTRACE:\n$stackLog' : '';
    final output =
        '$emoji $className$methodNameSection - ${event.message}$callStack';

    if (excludeLogsFromClasses
            .any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) return [];

    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    final result = <String>[];

    for (final line in output.split('\n')) {
      result.addAll(
        pattern.allMatches(line).map((match) {
          return _isReleaseMode ? match.group(0)! : color!(match.group(0)!);
        }),
      );
    }

    return result;
  }

  String? _getMethodName() {
    try {
      final currentStack = StackTrace.current;
      final formattedStacktrace = _formatStackTrace(currentStack, 3);

      final realFirstLine = formattedStacktrace
          ?.firstWhere((line) => line.contains(className), orElse: () => '');

      final methodName = realFirstLine?.replaceAll('$className.', '');

      return methodName;
    } catch (e) {
      // There's no deliberate function call from our code so we return null;
      return null;
    }
  }
}

final stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

List<String>? _formatStackTrace(StackTrace stackTrace, int methodCount) {
  final lines = stackTrace.toString().split('\n');

  final formatted = <String>[];
  var count = 0;
  for (final line in lines) {
    final match = stackTraceRegex.matchAsPrefix(line);
    if (match != null) {
      if (match.group(2)!.startsWith('package:logger')) {
        continue;
      }
      final newLine = '${match.group(1)}';
      formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
      if (++count == methodCount) {
        break;
      }
    } else {
      formatted.add(line);
    }
  }

  return formatted.isEmpty ? null : formatted;
}

class MultipleLoggerOutput extends LogOutput {
  MultipleLoggerOutput(this.logOutputs);

  final List<LogOutput> logOutputs;

  @override
  void output(OutputEvent event) {
    for (final logOutput in logOutputs) {
      try {
        logOutput.output(event);
      } catch (e) {
        log('Log output failed');
      }
    }
  }
}

// ignore: long-parameter-list
Logger getLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallStack = false,
  List<String> excludeLogsFromClasses = const [],
  String? showOnlyClass,
  bool usePrettyPrinter = false,
}) {
  // ignore: no_leading_underscores_for_local_identifiers
  final _usePrettyPrinter = usePrettyPrinter && Platform.I.isAndroid;

  return Logger(
    printer: _usePrettyPrinter
        ? PrettyPrinter(methodCount: printCallStack ? 1 : 0)
        : SimpleLogPrinter(
            className,
            printCallingFunctionName: printCallingFunctionName,
            printCallStack: printCallStack,
            showOnlyClass: showOnlyClass,
            excludeLogsFromClasses: excludeLogsFromClasses,
          ),
  );
}
