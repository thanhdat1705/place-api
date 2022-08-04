// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetail _$StoreDetailFromJson(Map<String, dynamic> json) {
  return StoreDetail(
    (json['utilities'] as List)
        ?.map((e) =>
            e == null ? null : Utilities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    json['venues'] == null
        ? null
        : Venues.fromJson(json['venues'] as Map<String, dynamic>),
    json['brand'] == null
        ? null
        : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    json['zone'] == null
        ? null
        : Zone.fromJson(json['zone'] as Map<String, dynamic>),
    json['id'] as String,
    (json['nearStores'] as List)
        ?.map(
            (e) => e == null ? null : Store.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoreDetailToJson(StoreDetail instance) =>
    <String, dynamic>{
      'utilities': instance.utilities,
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
      'venues': instance.venues,
      'brand': instance.brand,
      'zone': instance.zone,
      'id': instance.id,
      'nearStores': instance.nearStores,
    };
