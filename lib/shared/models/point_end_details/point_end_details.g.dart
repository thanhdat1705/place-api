// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_end_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointEndDetail _$PointEndDetailFromJson(Map<String, dynamic> json) {
  return PointEndDetail(
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['id'] as String,
  );
}

Map<String, dynamic> _$PointEndDetailToJson(PointEndDetail instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'id': instance.id,
    };
