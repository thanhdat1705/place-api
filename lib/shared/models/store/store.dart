
import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brands/brands.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
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
  Brand brand;
  String id;
  Store(
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
    this.brand,
    this.id,
  );

  Store.instance();
  Store fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson(json);
  }

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
