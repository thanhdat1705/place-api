// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_search_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchZone _$ResponseSearchZoneFromJson(Map<String, dynamic> json) {
  return ResponseSearchZone(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Zone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseSearchZoneToJson(ResponseSearchZone instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
