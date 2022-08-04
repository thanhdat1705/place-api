// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_start_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointStartDetail _$PointStartDetailFromJson(Map<String, dynamic> json) {
  return PointStartDetail(
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['id'] as String,
  );
}

Map<String, dynamic> _$PointStartDetailToJson(PointStartDetail instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'id': instance.id,
    };
