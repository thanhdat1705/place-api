// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_search_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchProvince _$ResponseSearchProvinceFromJson(
    Map<String, dynamic> json) {
  return ResponseSearchProvince(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Province.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseSearchProvinceToJson(
        ResponseSearchProvince instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
