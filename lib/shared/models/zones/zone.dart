import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/store_zones/store_zones.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_zones/street_segment_zone.dart';
import 'package:project_places_api_mobile/shared/models/wardZones/wardZones.dart';

part 'zone.g.dart';

@JsonSerializable()
class Zone {
  String name;
  String description;
  bool isSystemZone;
  List<Zone> containZones;
  List<StoreZones> storeZones;
  List<StreetSegmentZone> streetSegmentZones;
  List<WardZones> wardZones;
  String id;
  Zone(
    this.name,
    this.description,
    this.containZones,
    this.storeZones,
    this.streetSegmentZones,
    this.wardZones,
    this.id,
  );

  @override
  String toString() {
    return 'This is + $name';
  }

  Zone.instance();
  Zone fromJson(Map<String, dynamic> json) {
    return _$ZoneFromJson(json);
  }

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ZoneToJson(this);
}
