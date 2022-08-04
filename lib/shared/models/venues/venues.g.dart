// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venues _$VenuesFromJson(Map<String, dynamic> json) {
  return Venues(
    json['name'] as String,
    json['venuesLevel'] as int,
    json['venuesTypeId'] as String,
    json['imageUrl'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['parent'] == null
        ? null
        : Venues.fromJson(json['parent'] as Map<String, dynamic>),
    json['venuesType'] == null
        ? null
        : VenuesType.fromJson(json['venuesType'] as Map<String, dynamic>),
    json['id'] as String,
  );
}

Map<String, dynamic> _$VenuesToJson(Venues instance) => <String, dynamic>{
      'name': instance.name,
      'venuesLevel': instance.venuesLevel,
      'venuesTypeId': instance.venuesTypeId,
      'imageUrl': instance.imageUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'parent': instance.parent,
      'venuesType': instance.venuesType,
      'id': instance.id,
    };
