import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/point_end_details/point_end_details.dart';
import 'package:project_places_api_mobile/shared/models/point_start_details/point_start_details.dart';
import 'package:project_places_api_mobile/shared/models/street/street.dart';
import 'package:project_places_api_mobile/shared/models/ward/ward.dart';

part 'traffic_density.g.dart';

@JsonSerializable()
class TrafficDensity {
  String type;
  String iconUrl;
  String id;
  TrafficDensity(
    this.id,
    this.iconUrl,
    this.type
  );

  TrafficDensity.instance();
  TrafficDensity fromJson(Map<String, dynamic> json) {
    return _$TrafficDensityFromJson(json);
  }

  factory TrafficDensity.fromJson(Map<String, dynamic> json) =>
      _$TrafficDensityFromJson(json);
  Map<String, dynamic> toJson() => _$TrafficDensityToJson(this);
}
