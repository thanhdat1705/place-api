// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street_segment_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreetSegmentZone _$StreetSegmentZoneFromJson(Map<String, dynamic> json) {
  return StreetSegmentZone(
    json['streetSegmentId'] as String,
    json['zoneId'] as String,
    json['streetSegment'] == null
        ? null
        : StreetSegments.fromJson(
            json['streetSegment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreetSegmentZoneToJson(StreetSegmentZone instance) =>
    <String, dynamic>{
      'streetSegmentId': instance.streetSegmentId,
      'zoneId': instance.zoneId,
      'streetSegment': instance.streetSegment,
    };
