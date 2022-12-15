// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication_repository/authentication_repository.dart'
    as _i7;

// Package imports:
import 'package:crashlytics_service/crashlytics_service.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:hive_service/hive_service.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_repository/task_repository.dart' as _i8;

// Project imports:
import 'package:shift_planner/app/injection/general_module.dart' as _i10;
import 'package:shift_planner/app/injection/repository_module.dart' as _i11;
import 'package:shift_planner/app/injection/service_module.dart' as _i9;
import 'package:shift_planner/app/router/router.dart' as _i3;

const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final generalModule = _$GeneralModule();
    final serviceModule = _$ServiceModule();
    final repositoryModule = _$RepositoryModule();
    gh.lazySingleton<_i3.AppRouter>(() => generalModule.router);
    gh.singleton<_i4.CrashlyticsService>(serviceModule.crashlyticsService);
    gh.singleton<_i5.IHiveService>(
      serviceModule.devHiveService,
      registerFor: {_dev},
    );
    gh.singleton<_i5.IHiveService>(
      serviceModule.hiveService,
      registerFor: {_prod},
    );
    await gh.factoryAsync<_i6.Box<dynamic>>(
      () => generalModule.box(gh<_i5.IHiveService>()),
      preResolve: true,
    );
    gh.singleton<_i7.AuthenticationRepository>(
        repositoryModule.authenticationRepository(gh<_i6.Box<dynamic>>()));
    gh.lazySingleton<_i8.ITaskRepository>(() =>
        repositoryModule.taskRepository(gh<_i7.AuthenticationRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i9.ServiceModule {}

class _$GeneralModule extends _i10.GeneralModule {}

class _$RepositoryModule extends _i11.RepositoryModule {}
