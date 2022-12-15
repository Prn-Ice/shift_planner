// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_task_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTaskRequest _$CreateTaskRequestFromJson(Map<String, dynamic> json) {
  return _CreateTaskRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTaskRequest {
  String? get title => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  String? get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTaskRequestCopyWith<CreateTaskRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskRequestCopyWith<$Res> {
  factory $CreateTaskRequestCopyWith(
          CreateTaskRequest value, $Res Function(CreateTaskRequest) then) =
      _$CreateTaskRequestCopyWithImpl<$Res, CreateTaskRequest>;
  @useResult
  $Res call({String? title, DateTime? dueDate, String? shift});
}

/// @nodoc
class _$CreateTaskRequestCopyWithImpl<$Res, $Val extends CreateTaskRequest>
    implements $CreateTaskRequestCopyWith<$Res> {
  _$CreateTaskRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? dueDate = freezed,
    Object? shift = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateTaskRequestCopyWith<$Res>
    implements $CreateTaskRequestCopyWith<$Res> {
  factory _$$_CreateTaskRequestCopyWith(_$_CreateTaskRequest value,
          $Res Function(_$_CreateTaskRequest) then) =
      __$$_CreateTaskRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, DateTime? dueDate, String? shift});
}

/// @nodoc
class __$$_CreateTaskRequestCopyWithImpl<$Res>
    extends _$CreateTaskRequestCopyWithImpl<$Res, _$_CreateTaskRequest>
    implements _$$_CreateTaskRequestCopyWith<$Res> {
  __$$_CreateTaskRequestCopyWithImpl(
      _$_CreateTaskRequest _value, $Res Function(_$_CreateTaskRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? dueDate = freezed,
    Object? shift = freezed,
  }) {
    return _then(_$_CreateTaskRequest(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateTaskRequest implements _CreateTaskRequest {
  const _$_CreateTaskRequest({this.title, this.dueDate, this.shift});

  factory _$_CreateTaskRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTaskRequestFromJson(json);

  @override
  final String? title;
  @override
  final DateTime? dueDate;
  @override
  final String? shift;

  @override
  String toString() {
    return 'CreateTaskRequest(title: $title, dueDate: $dueDate, shift: $shift)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTaskRequest &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, dueDate, shift);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTaskRequestCopyWith<_$_CreateTaskRequest> get copyWith =>
      __$$_CreateTaskRequestCopyWithImpl<_$_CreateTaskRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTaskRequestToJson(
      this,
    );
  }
}

abstract class _CreateTaskRequest implements CreateTaskRequest {
  const factory _CreateTaskRequest(
      {final String? title,
      final DateTime? dueDate,
      final String? shift}) = _$_CreateTaskRequest;

  factory _CreateTaskRequest.fromJson(Map<String, dynamic> json) =
      _$_CreateTaskRequest.fromJson;

  @override
  String? get title;
  @override
  DateTime? get dueDate;
  @override
  String? get shift;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTaskRequestCopyWith<_$_CreateTaskRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
