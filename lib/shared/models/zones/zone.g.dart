// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return Zone(
    json['name'] as String,
    json['description'] as String,
    (json['containZones'] as List)
        ?.map(
            (e) => e == null ? null : Zone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['storeZones'] as List)
        ?.map((e) =>
            e == null ? null : StoreZones.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['streetSegmentZones'] as List)
        ?.map((e) => e == null
            ? null
            : StreetSegmentZone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['wardZones'] as List)
        ?.map((e) =>
            e == null ? null : WardZones.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['id'] as String,
  )..isSystemZone = json['isSystemZone'] as bool;
}

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'isSystemZone': instance.isSystemZone,
      'containZones': instance.containZones,
      'storeZones': instance.storeZones,
      'streetSegmentZones': instance.streetSegmentZones,
      'wardZones': instance.wardZones,
      'id': instance.id,
    };
