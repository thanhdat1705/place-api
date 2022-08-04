import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/ward/ward.dart';

part 'wardZones.g.dart';

@JsonSerializable()
class WardZones {
  String wardId;
  String zoneId;
  Ward ward;
  WardZones(
    this.wardId,
    this.zoneId,
    this.ward,
  );

  WardZones.instance();
  WardZones fromJson(Map<String, dynamic> json) {
    return _$WardZonesFromJson(json);
  }

  factory WardZones.fromJson(Map<String, dynamic> json) =>
      _$WardZonesFromJson(json);
  Map<String, dynamic> toJson() => _$WardZonesToJson(this);
}
