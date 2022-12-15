// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  AuthenticationRepository authenticationRepository(Box<dynamic> box) {
    return AuthenticationRepository(box: box);
  }
}
