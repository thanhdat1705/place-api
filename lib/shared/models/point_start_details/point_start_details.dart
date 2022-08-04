import 'package:json_annotation/json_annotation.dart';

part 'point_start_details.g.dart';

@JsonSerializable()
class PointStartDetail {
  double latitude;
  double longitude;
  String id;

  PointStartDetail(this.latitude, this.longitude, this.id);

  PointStartDetail.instance();
  PointStartDetail fromJson(Map<String, dynamic> json) {
    return _$PointStartDetailFromJson(json);
  }

  factory PointStartDetail.fromJson(Map<String, dynamic> json) =>
      _$PointStartDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PointStartDetailToJson(this);
}
