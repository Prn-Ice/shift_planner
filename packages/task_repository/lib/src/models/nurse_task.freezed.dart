// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nurse_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NurseTask _$NurseTaskFromJson(Map<String, dynamic> json) {
  return _NurseTask.fromJson(json);
}

/// @nodoc
mixin _$NurseTask {
  String? get title => throw _privateConstructorUsedError;
  bool? get isComplete => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  Shift? get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NurseTaskCopyWith<NurseTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NurseTaskCopyWith<$Res> {
  factory $NurseTaskCopyWith(NurseTask value, $Res Function(NurseTask) then) =
      _$NurseTaskCopyWithImpl<$Res, NurseTask>;
  @useResult
  $Res call({String? title, bool? isComplete, DateTime? dueDate, Shift? shift});
}

/// @nodoc
class _$NurseTaskCopyWithImpl<$Res, $Val extends NurseTask>
    implements $NurseTaskCopyWith<$Res> {
  _$NurseTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? isComplete = freezed,
    Object? dueDate = freezed,
    Object? shift = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NurseTaskCopyWith<$Res> implements $NurseTaskCopyWith<$Res> {
  factory _$$_NurseTaskCopyWith(
          _$_NurseTask value, $Res Function(_$_NurseTask) then) =
      __$$_NurseTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, bool? isComplete, DateTime? dueDate, Shift? shift});
}

/// @nodoc
class __$$_NurseTaskCopyWithImpl<$Res>
    extends _$NurseTaskCopyWithImpl<$Res, _$_NurseTask>
    implements _$$_NurseTaskCopyWith<$Res> {
  __$$_NurseTaskCopyWithImpl(
      _$_NurseTask _value, $Res Function(_$_NurseTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? isComplete = freezed,
    Object? dueDate = freezed,
    Object? shift = freezed,
  }) {
    return _then(_$_NurseTask(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NurseTask implements _NurseTask {
  const _$_NurseTask({this.title, this.isComplete, this.dueDate, this.shift});

  factory _$_NurseTask.fromJson(Map<String, dynamic> json) =>
      _$$_NurseTaskFromJson(json);

  @override
  final String? title;
  @override
  final bool? isComplete;
  @override
  final DateTime? dueDate;
  @override
  final Shift? shift;

  @override
  String toString() {
    return 'NurseTask(title: $title, isComplete: $isComplete, dueDate: $dueDate, shift: $shift)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NurseTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, isComplete, dueDate, shift);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NurseTaskCopyWith<_$_NurseTask> get copyWith =>
      __$$_NurseTaskCopyWithImpl<_$_NurseTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NurseTaskToJson(
      this,
    );
  }
}

abstract class _NurseTask implements NurseTask {
  const factory _NurseTask(
      {final String? title,
      final bool? isComplete,
      final DateTime? dueDate,
      final Shift? shift}) = _$_NurseTask;

  factory _NurseTask.fromJson(Map<String, dynamic> json) =
      _$_NurseTask.fromJson;

  @override
  String? get title;
  @override
  bool? get isComplete;
  @override
  DateTime? get dueDate;
  @override
  Shift? get shift;
  @override
  @JsonKey(ignore: true)
  _$$_NurseTaskCopyWith<_$_NurseTask> get copyWith =>
      throw _privateConstructorUsedError;
}
