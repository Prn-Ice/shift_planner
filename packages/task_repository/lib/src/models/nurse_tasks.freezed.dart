// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nurse_tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NurseTasks _$NurseTasksFromJson(Map<String, dynamic> json) {
  return _NurseTasks.fromJson(json);
}

/// @nodoc
mixin _$NurseTasks {
  List<NurseTask>? get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NurseTasksCopyWith<NurseTasks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NurseTasksCopyWith<$Res> {
  factory $NurseTasksCopyWith(
          NurseTasks value, $Res Function(NurseTasks) then) =
      _$NurseTasksCopyWithImpl<$Res, NurseTasks>;
  @useResult
  $Res call({List<NurseTask>? tasks});
}

/// @nodoc
class _$NurseTasksCopyWithImpl<$Res, $Val extends NurseTasks>
    implements $NurseTasksCopyWith<$Res> {
  _$NurseTasksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<NurseTask>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NurseTasksCopyWith<$Res>
    implements $NurseTasksCopyWith<$Res> {
  factory _$$_NurseTasksCopyWith(
          _$_NurseTasks value, $Res Function(_$_NurseTasks) then) =
      __$$_NurseTasksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NurseTask>? tasks});
}

/// @nodoc
class __$$_NurseTasksCopyWithImpl<$Res>
    extends _$NurseTasksCopyWithImpl<$Res, _$_NurseTasks>
    implements _$$_NurseTasksCopyWith<$Res> {
  __$$_NurseTasksCopyWithImpl(
      _$_NurseTasks _value, $Res Function(_$_NurseTasks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_$_NurseTasks(
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<NurseTask>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NurseTasks implements _NurseTasks {
  const _$_NurseTasks({final List<NurseTask>? tasks}) : _tasks = tasks;

  factory _$_NurseTasks.fromJson(Map<String, dynamic> json) =>
      _$$_NurseTasksFromJson(json);

  final List<NurseTask>? _tasks;
  @override
  List<NurseTask>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NurseTasks(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NurseTasks &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NurseTasksCopyWith<_$_NurseTasks> get copyWith =>
      __$$_NurseTasksCopyWithImpl<_$_NurseTasks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NurseTasksToJson(
      this,
    );
  }
}

abstract class _NurseTasks implements NurseTasks {
  const factory _NurseTasks({final List<NurseTask>? tasks}) = _$_NurseTasks;

  factory _NurseTasks.fromJson(Map<String, dynamic> json) =
      _$_NurseTasks.fromJson;

  @override
  List<NurseTask>? get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_NurseTasksCopyWith<_$_NurseTasks> get copyWith =>
      throw _privateConstructorUsedError;
}
