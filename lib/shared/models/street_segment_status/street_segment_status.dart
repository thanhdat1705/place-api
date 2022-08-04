import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/traffic_density/traffic_density.dart';

part 'street_segment_status.g.dart';

@JsonSerializable()
class StreetSegmentStatus {
  String streetSegmentId;
  String timeStart;
  String timeEnd;
  String trafficDensityId;
  double avgVehicleSpeed;
  int numberOfLanes;
  bool status;
  TrafficDensity trafficDensity;
  String id;
  StreetSegmentStatus(
    this.id,
    this.avgVehicleSpeed,
    this.numberOfLanes,
    this.status,
    this.streetSegmentId,
    this.timeEnd,
    this.timeStart,
    this.trafficDensityId,
    this.trafficDensity
  );

  StreetSegmentStatus.instance();
  StreetSegmentStatus fromJson(Map<String, dynamic> json) {
    return _$StreetSegmentStatusFromJson(json);
  }

  factory StreetSegmentStatus.fromJson(Map<String, dynamic> json) =>
      _$StreetSegmentStatusFromJson(json);
  Map<String, dynamic> toJson() => _$StreetSegmentStatusToJson(this);
}
