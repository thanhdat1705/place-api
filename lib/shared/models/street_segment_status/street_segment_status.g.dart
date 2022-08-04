// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street_segment_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreetSegmentStatus _$StreetSegmentStatusFromJson(Map<String, dynamic> json) {
  return StreetSegmentStatus(
    json['id'] as String,
    (json['avgVehicleSpeed'] as num)?.toDouble(),
    json['numberOfLanes'] as int,
    json['status'] as bool,
    json['streetSegmentId'] as String,
    json['timeEnd'] as String,
    json['timeStart'] as String,
    json['trafficDensityId'] as String,
    json['trafficDensity'] == null
        ? null
        : TrafficDensity.fromJson(
            json['trafficDensity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreetSegmentStatusToJson(
        StreetSegmentStatus instance) =>
    <String, dynamic>{
      'streetSegmentId': instance.streetSegmentId,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'trafficDensityId': instance.trafficDensityId,
      'avgVehicleSpeed': instance.avgVehicleSpeed,
      'numberOfLanes': instance.numberOfLanes,
      'status': instance.status,
      'trafficDensity': instance.trafficDensity,
      'id': instance.id,
    };
