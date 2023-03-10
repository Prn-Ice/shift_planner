// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:shift_planner/app/injection/ioc.config.dart';

final GetIt _getIt = GetIt.instance;

@injectableInit
void configureDependencies({String? environment}) =>
    _getIt.init(environment: environment);

T resolve<T extends Object>() => _getIt<T>();

T resolveWithParameter<T extends Object, TP>({TP? parameter}) =>
    _getIt<T>(param1: parameter);

GetIt configureTestDependencies() {
  _getIt.reset();
  configureDependencies(environment: Environment.test);
  _getIt.allowReassignment = true;

  return _getIt;
}
