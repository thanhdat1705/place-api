// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venues_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenuesType _$VenuesTypeFromJson(Map<String, dynamic> json) {
  return VenuesType(
    json['name'] as String,
    json['description'] as String,
    json['venuesTypeLevel'] as int,
    json['id'] as String,
  );
}

Map<String, dynamic> _$VenuesTypeToJson(VenuesType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'venuesTypeLevel': instance.venuesTypeLevel,
      'id': instance.id,
    };
