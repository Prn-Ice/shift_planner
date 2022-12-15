// Dart imports:
import 'dart:async';

// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @LazySingleton(dispose: disposeAuthenticationRepository)
  AuthenticationRepository authenticationRepository(Box<dynamic> box) {
    return AuthenticationRepository(box: box);
  }
}

FutureOr<void> disposeAuthenticationRepository(
  AuthenticationRepository instance,
) {
  instance.dispose();
}
