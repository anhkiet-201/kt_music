// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'uuid': instance.uuid,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'age': instance.age,
    };
