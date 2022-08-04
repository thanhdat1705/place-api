import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';

part 'street_segment_zone.g.dart';

@JsonSerializable()
class StreetSegmentZone {
  String streetSegmentId;
  String zoneId;
  StreetSegments streetSegment;
  StreetSegmentZone(this.streetSegmentId, this.zoneId, this.streetSegment);

  @override
  String toString() {
    return 'Zone ID: $zoneId, StreetSegmentId: $streetSegmentId';
  }

  StreetSegmentZone.instance();
  StreetSegmentZone fromJson(Map<String, dynamic> json) {
    return _$StreetSegmentZoneFromJson(json);
  }

  factory StreetSegmentZone.fromJson(Map<String, dynamic> json) =>
      _$StreetSegmentZoneFromJson(json);
  Map<String, dynamic> toJson() => _$StreetSegmentZoneToJson(this);
}
