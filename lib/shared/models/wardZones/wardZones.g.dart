// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wardZones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WardZones _$WardZonesFromJson(Map<String, dynamic> json) {
  return WardZones(
    json['wardId'] as String,
    json['zoneId'] as String,
    json['ward'] == null
        ? null
        : Ward.fromJson(json['ward'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WardZonesToJson(WardZones instance) => <String, dynamic>{
      'wardId': instance.wardId,
      'zoneId': instance.zoneId,
      'ward': instance.ward,
    };
