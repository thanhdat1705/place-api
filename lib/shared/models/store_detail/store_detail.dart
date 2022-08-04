import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brands/brands.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/utilities/utilities.dart';
import 'package:project_places_api_mobile/shared/models/venues/venues.dart';
import 'package:project_places_api_mobile/shared/models/zones/zone.dart';

part 'store_detail.g.dart';

@JsonSerializable()
class StoreDetail {
  List<Utilities> utilities;
  String name;
  String description;
  double area;
  int numberOfSeat;
  String openTime;
  String closeTime;
  String imageUrl;
  double avgAmountOfGuest;
  String address;
  double latitude;
  double longitude;
  String brandId;
  String zoneId;
  String venuesId;
  Venues venues;
  Brand brand;
  Zone zone;
  String id;
  List<Store> nearStores;

  StoreDetail(
    this.utilities,
    this.name,
    this.description,
    this.area,
    this.numberOfSeat,
    this.openTime,
    this.closeTime,
    this.imageUrl,
    this.avgAmountOfGuest,
    this.address,
    this.latitude,
    this.longitude,
    this.brandId,
    this.zoneId,
    this.venuesId,
    this.venues,
    this.brand,
    this.zone,
    this.id,
    this.nearStores,
  );

  StoreDetail.instance();
  StoreDetail fromJson(Map<String, dynamic> json) {
    return _$StoreDetailFromJson(json);
  }

  factory StoreDetail.fromJson(Map<String, dynamic> json) => _$StoreDetailFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDetailToJson(this);
}
