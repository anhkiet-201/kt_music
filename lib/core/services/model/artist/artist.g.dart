// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      description: json['description'] as String?,
      member: (json['member'] as List<dynamic>)
          .map((e) => ArtistMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'member': instance.member.map((e) => e.toJson()).toList(),
    };
