import 'package:json_annotation/json_annotation.dart';

part 'point_end_details.g.dart';

@JsonSerializable()
class PointEndDetail {
  double latitude;
  double longitude;
  String id;

  PointEndDetail(this.latitude, this.longitude, this.id);

  PointEndDetail.instance();
  PointEndDetail fromJson(Map<String, dynamic> json) {
    return _$PointEndDetailFromJson(json);
  }

  factory PointEndDetail.fromJson(Map<String, dynamic> json) =>
      _$PointEndDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PointEndDetailToJson(this);
}
