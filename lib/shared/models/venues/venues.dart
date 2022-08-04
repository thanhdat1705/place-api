import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brand_field/brand_field.dart';
import 'package:project_places_api_mobile/shared/models/venues_type/venues_type.dart';
//import 'package:mapper/mapper.dart';

part 'venues.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class Venues {
  String name;
  int venuesLevel;
  String venuesTypeId;
  String imageUrl;
  double latitude;
  double longitude;
  Venues parent;
  VenuesType venuesType;
  String id;

  Venues(this.name, this.venuesLevel, this.venuesTypeId, this.imageUrl,
      this.latitude, this.longitude, this.parent, this.venuesType, this.id);

  Venues.instance();
  Venues fromJson(Map<String, dynamic> json) {
    return _$VenuesFromJson(json);
  }

  factory Venues.fromJson(Map<String, dynamic> json) => _$VenuesFromJson(json);
  Map<String, dynamic> toJson() => _$VenuesToJson(this);
}
