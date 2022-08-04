// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    json['name'] as String,
    json['description'] as String,
    (json['area'] as num)?.toDouble(),
    json['numberOfSeat'] as int,
    json['openTime'] as String,
    json['closeTime'] as String,
    json['imageUrl'] as String,
    (json['avgAmountOfGuest'] as num)?.toDouble(),
    json['address'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['brandId'] as String,
    json['zoneId'] as String,
    json['venuesId'] as String,
    json['brand'] == null
        ? null
        : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    json['id'] as String,
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'area': instance.area,
      'numberOfSeat': instance.numberOfSeat,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'imageUrl': instance.imageUrl,
      'avgAmountOfGuest': instance.avgAmountOfGuest,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'brandId': instance.brandId,
      'zoneId': instance.zoneId,
      'venuesId': instance.venuesId,
      'brand': instance.brand,
      'id': instance.id,
    };
