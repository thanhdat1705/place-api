// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map<String, dynamic> json) {
  return Ward(
    json['name'] as String,
    json['districtId'] as String,
    json['createAt'] as String,
    json['updateAt'] as String,
    json['district'] == null
        ? null
        : District.fromJson(json['district'] as Map<String, dynamic>),
    json['id'] as String,
  );
}

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'name': instance.name,
      'districtId': instance.districtId,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'district': instance.district,
      'id': instance.id,
    };
