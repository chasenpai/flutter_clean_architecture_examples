// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyInfoState _$CompanyInfoStateFromJson(Map<String, dynamic> json) {
  return _CompanyInfoState.fromJson(json);
}

/// @nodoc
mixin _$CompanyInfoState {
  CompanyInfo? get companyInfo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyInfoStateCopyWith<CompanyInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyInfoStateCopyWith<$Res> {
  factory $CompanyInfoStateCopyWith(
          CompanyInfoState value, $Res Function(CompanyInfoState) then) =
      _$CompanyInfoStateCopyWithImpl<$Res, CompanyInfoState>;
  @useResult
  $Res call({CompanyInfo? companyInfo, bool isLoading, String? errorMsg});

  $CompanyInfoCopyWith<$Res>? get companyInfo;
}

/// @nodoc
class _$CompanyInfoStateCopyWithImpl<$Res, $Val extends CompanyInfoState>
    implements $CompanyInfoStateCopyWith<$Res> {
  _$CompanyInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyInfo = freezed,
    Object? isLoading = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      companyInfo: freezed == companyInfo
          ? _value.companyInfo
          : companyInfo // ignore: cast_nullable_to_non_nullable
              as CompanyInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyInfoCopyWith<$Res>? get companyInfo {
    if (_value.companyInfo == null) {
      return null;
    }

    return $CompanyInfoCopyWith<$Res>(_value.companyInfo!, (value) {
      return _then(_value.copyWith(companyInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyInfoStateImplCopyWith<$Res>
    implements $CompanyInfoStateCopyWith<$Res> {
  factory _$$CompanyInfoStateImplCopyWith(_$CompanyInfoStateImpl value,
          $Res Function(_$CompanyInfoStateImpl) then) =
      __$$CompanyInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CompanyInfo? companyInfo, bool isLoading, String? errorMsg});

  @override
  $CompanyInfoCopyWith<$Res>? get companyInfo;
}

/// @nodoc
class __$$CompanyInfoStateImplCopyWithImpl<$Res>
    extends _$CompanyInfoStateCopyWithImpl<$Res, _$CompanyInfoStateImpl>
    implements _$$CompanyInfoStateImplCopyWith<$Res> {
  __$$CompanyInfoStateImplCopyWithImpl(_$CompanyInfoStateImpl _value,
      $Res Function(_$CompanyInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyInfo = freezed,
    Object? isLoading = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_$CompanyInfoStateImpl(
      companyInfo: freezed == companyInfo
          ? _value.companyInfo
          : companyInfo // ignore: cast_nullable_to_non_nullable
              as CompanyInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyInfoStateImpl implements _CompanyInfoState {
  const _$CompanyInfoStateImpl(
      {this.companyInfo, this.isLoading = false, this.errorMsg});

  factory _$CompanyInfoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyInfoStateImplFromJson(json);

  @override
  final CompanyInfo? companyInfo;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'CompanyInfoState(companyInfo: $companyInfo, isLoading: $isLoading, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyInfoStateImpl &&
            (identical(other.companyInfo, companyInfo) ||
                other.companyInfo == companyInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, companyInfo, isLoading, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyInfoStateImplCopyWith<_$CompanyInfoStateImpl> get copyWith =>
      __$$CompanyInfoStateImplCopyWithImpl<_$CompanyInfoStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyInfoStateImplToJson(
      this,
    );
  }
}

abstract class _CompanyInfoState implements CompanyInfoState {
  const factory _CompanyInfoState(
      {final CompanyInfo? companyInfo,
      final bool isLoading,
      final String? errorMsg}) = _$CompanyInfoStateImpl;

  factory _CompanyInfoState.fromJson(Map<String, dynamic> json) =
      _$CompanyInfoStateImpl.fromJson;

  @override
  CompanyInfo? get companyInfo;
  @override
  bool get isLoading;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$CompanyInfoStateImplCopyWith<_$CompanyInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
