import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';

part 'store_zones.g.dart';

@JsonSerializable()
class StoreZones {
  String storeId;
  String zoneId;
  Store store;

  StoreZones(
    this.storeId,
    this.zoneId,
    this.store,
  );

  StoreZones.instance();
  StoreZones fromJson(Map<String, dynamic> json) {
    return _$StoreZonesFromJson(json);
  }

  factory StoreZones.fromJson(Map<String, dynamic> json) =>
      _$StoreZonesFromJson(json);
  Map<String, dynamic> toJson() => _$StoreZonesToJson(this);
}
