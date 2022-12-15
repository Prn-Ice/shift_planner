import 'package:authentication_repository/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_repository/hive_repository.dart';

class AuthenticationLocalDataSource extends HiveRepository<User> {
  AuthenticationLocalDataSource({required super.box});

  static const key = '__user_cache_key__';

  @override
  User? fromJson(Map<String, dynamic> json) {
    return Option.tryCatch(() => User.fromMap(json))
        .getOrElse(() => User.empty);
  }

  @override
  Map<String, dynamic>? toJson(User item) {
    return item.toMap();
  }
}
