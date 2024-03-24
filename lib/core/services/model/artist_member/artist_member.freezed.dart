// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistMember _$ArtistMemberFromJson(Map<String, dynamic> json) {
  return _ArtistMember.fromJson(json);
}

/// @nodoc
mixin _$ArtistMember {
  String get uuid => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistMemberCopyWith<ArtistMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistMemberCopyWith<$Res> {
  factory $ArtistMemberCopyWith(
          ArtistMember value, $Res Function(ArtistMember) then) =
      _$ArtistMemberCopyWithImpl<$Res, ArtistMember>;
  @useResult
  $Res call({String uuid, String position});
}

/// @nodoc
class _$ArtistMemberCopyWithImpl<$Res, $Val extends ArtistMember>
    implements $ArtistMemberCopyWith<$Res> {
  _$ArtistMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistMemberImplCopyWith<$Res>
    implements $ArtistMemberCopyWith<$Res> {
  factory _$$ArtistMemberImplCopyWith(
          _$ArtistMemberImpl value, $Res Function(_$ArtistMemberImpl) then) =
      __$$ArtistMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String position});
}

/// @nodoc
class __$$ArtistMemberImplCopyWithImpl<$Res>
    extends _$ArtistMemberCopyWithImpl<$Res, _$ArtistMemberImpl>
    implements _$$ArtistMemberImplCopyWith<$Res> {
  __$$ArtistMemberImplCopyWithImpl(
      _$ArtistMemberImpl _value, $Res Function(_$ArtistMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? position = null,
  }) {
    return _then(_$ArtistMemberImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ArtistMemberImpl with DiagnosticableTreeMixin implements _ArtistMember {
  const _$ArtistMemberImpl({required this.uuid, required this.position});

  factory _$ArtistMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistMemberImplFromJson(json);

  @override
  final String uuid;
  @override
  final String position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtistMember(uuid: $uuid, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtistMember'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistMemberImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistMemberImplCopyWith<_$ArtistMemberImpl> get copyWith =>
      __$$ArtistMemberImplCopyWithImpl<_$ArtistMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistMemberImplToJson(
      this,
    );
  }
}

abstract class _ArtistMember implements ArtistMember {
  const factory _ArtistMember(
      {required final String uuid,
      required final String position}) = _$ArtistMemberImpl;

  factory _ArtistMember.fromJson(Map<String, dynamic> json) =
      _$ArtistMemberImpl.fromJson;

  @override
  String get uuid;
  @override
  String get position;
  @override
  @JsonKey(ignore: true)
  _$$ArtistMemberImplCopyWith<_$ArtistMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
