// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street_segments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreetSegments _$StreetSegmentsFromJson(Map<String, dynamic> json) {
  return StreetSegments(
    json['description'] as String,
    json['id'] as String,
    json['pointEnd'] as String,
    json['pointEndDetails'] == null
        ? null
        : PointEndDetail.fromJson(
            json['pointEndDetails'] as Map<String, dynamic>),
    json['pointStart'] as String,
    json['pointStartDetails'] == null
        ? null
        : PointStartDetail.fromJson(
            json['pointStartDetails'] as Map<String, dynamic>),
    json['street'] == null
        ? null
        : Street.fromJson(json['street'] as Map<String, dynamic>),
    json['streetId'] as String,
    json['wardId'] as String,
    json['streetSegmentPath'] as String,
    json['houseNumberEnd'] as int,
    json['houseNumberStart'] as int,
    (json['streetSegmentStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : StreetSegmentStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['ward'] == null
        ? null
        : Ward.fromJson(json['ward'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreetSegmentsToJson(StreetSegments instance) =>
    <String, dynamic>{
      'description': instance.description,
      'pointStart': instance.pointStart,
      'pointEnd': instance.pointEnd,
      'wardId': instance.wardId,
      'streetId': instance.streetId,
      'pointEndDetails': instance.pointEndDetails,
      'pointStartDetails': instance.pointStartDetails,
      'street': instance.street,
      'streetSegmentPath': instance.streetSegmentPath,
      'houseNumberStart': instance.houseNumberStart,
      'houseNumberEnd': instance.houseNumberEnd,
      'ward': instance.ward,
      'streetSegmentStatuses': instance.streetSegmentStatuses,
      'id': instance.id,
    };
