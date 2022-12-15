// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:task_repository/task_repository.dart';

@module
abstract class RepositoryModule {
  @singleton
  AuthenticationRepository authenticationRepository(Box<dynamic> box) {
    return AuthenticationRepository(box: box);
  }

  @LazySingleton(as: ITaskRepository)
  TaskRepository taskRepository(
    AuthenticationRepository authenticationRepository,
  ) {
    return TaskRepository(authenticationRepository: authenticationRepository);
  }
}
