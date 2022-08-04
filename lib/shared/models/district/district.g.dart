// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
    json['name'] as String,
    json['provinceId'] as String,
    json['createAt'] as String,
    json['updateAt'] as String,
    json['province'] == null
        ? null
        : Province.fromJson(json['province'] as Map<String, dynamic>),
    json['id'] as String,
  );
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'name': instance.name,
      'provinceId': instance.provinceId,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'province': instance.province,
      'id': instance.id,
    };
