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

// Project imports:
import '../router/router.dart' as _i3;
import 'general_module.dart' as _i8;
import 'repository_module.dart' as _i10;
import 'service_module.dart' as _i9;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
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
    () => generalModule.box(get<_i5.IHiveService>()),
    preResolve: true,
  );
  gh.lazySingleton<_i7.AuthenticationRepository>(
      () => repositoryModule.authenticationRepository(get<_i6.Box<dynamic>>()));
  return get;
}

class _$GeneralModule extends _i8.GeneralModule {}

class _$ServiceModule extends _i9.ServiceModule {}

class _$RepositoryModule extends _i10.RepositoryModule {}
