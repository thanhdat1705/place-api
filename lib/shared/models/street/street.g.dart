// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Street _$StreetFromJson(Map<String, dynamic> json) {
  return Street(
    json['name'] as String,
    json['imageUrl'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$StreetToJson(Street instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };
