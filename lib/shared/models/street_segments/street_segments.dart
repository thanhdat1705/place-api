import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/point_end_details/point_end_details.dart';
import 'package:project_places_api_mobile/shared/models/point_start_details/point_start_details.dart';
import 'package:project_places_api_mobile/shared/models/street/street.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_status/street_segment_status.dart';
import 'package:project_places_api_mobile/shared/models/ward/ward.dart';

part 'street_segments.g.dart';

@JsonSerializable()
class StreetSegments {
  String description;
  String pointStart;
  String pointEnd;
  String wardId;
  String streetId;
  PointEndDetail pointEndDetails;
  PointStartDetail pointStartDetails;
  Street street;
  String streetSegmentPath;
  int houseNumberStart;
  int houseNumberEnd;
  Ward ward;
  List<StreetSegmentStatus> streetSegmentStatuses;
  String id;
  StreetSegments(
    this.description,
    this.id,
    this.pointEnd,
    this.pointEndDetails,
    this.pointStart,
    this.pointStartDetails,
    this.street,
    this.streetId,
    this.wardId,
    this.streetSegmentPath,
    this.houseNumberEnd,
    this.houseNumberStart,
    this.streetSegmentStatuses,
    this.ward
  );

  StreetSegments.instance();
  StreetSegments fromJson(Map<String, dynamic> json) {
    return _$StreetSegmentsFromJson(json);
  }

  factory StreetSegments.fromJson(Map<String, dynamic> json) =>
      _$StreetSegmentsFromJson(json);
  Map<String, dynamic> toJson() => _$StreetSegmentsToJson(this);
}
