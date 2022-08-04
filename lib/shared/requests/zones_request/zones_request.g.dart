// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zones_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZonesRequest _$ZonesRequestFromJson(Map<String, dynamic> json) {
  return ZonesRequest(
    json['limit'] as int,
    json['page'] as int,
    json['sortField'] as String,
    json['sortOrder'] as int,
    json['searchMain'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['address'] as String,
    json['searchBy'] as int,
  );
}

Map<String, dynamic> _$ZonesRequestToJson(ZonesRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'searchMain': instance.searchMain,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'searchBy': instance.searchBy,
    };
