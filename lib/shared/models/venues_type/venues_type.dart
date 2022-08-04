import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brand_field/brand_field.dart';
//import 'package:mapper/mapper.dart';

part 'venues_type.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class VenuesType {
  String name;
  String description;
  int venuesTypeLevel;
  String id;
  
  VenuesType(this.name, this.description, this.venuesTypeLevel, this.id);

  VenuesType.instance();
  VenuesType fromJson(Map<String, dynamic> json) {
    return _$VenuesTypeFromJson(json);
  }

  factory VenuesType.fromJson(Map<String, dynamic> json) => _$VenuesTypeFromJson(json);
  Map<String, dynamic> toJson() => _$VenuesTypeToJson(this);
}
