// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreZones _$StoreZonesFromJson(Map<String, dynamic> json) {
  return StoreZones(
    json['storeId'] as String,
    json['zoneId'] as String,
    json['store'] == null
        ? null
        : Store.fromJson(json['store'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StoreZonesToJson(StoreZones instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'zoneId': instance.zoneId,
      'store': instance.store,
    };
