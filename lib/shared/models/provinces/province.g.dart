// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    json['name'] as String,
    json['createAt'] as String,
    json['updateAt'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'name': instance.name,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
    };
