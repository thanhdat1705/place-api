// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traffic_density.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficDensity _$TrafficDensityFromJson(Map<String, dynamic> json) {
  return TrafficDensity(
    json['id'] as String,
    json['iconUrl'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$TrafficDensityToJson(TrafficDensity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'iconUrl': instance.iconUrl,
      'id': instance.id,
    };
