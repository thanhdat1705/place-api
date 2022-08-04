import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/point_end_details/point_end_details.dart';
import 'package:project_places_api_mobile/shared/models/point_start_details/point_start_details.dart';
import 'package:project_places_api_mobile/shared/models/provinces/province.dart';
import 'package:project_places_api_mobile/shared/models/street/street.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  String name;
  String provinceId;
  String createAt;
  String updateAt;
  Province province;
  String id;
  District(
    this.name,
    this.provinceId,
    this.createAt,
    this.updateAt,
    this.province,
    this.id,
  );

  District.instance();
  District fromJson(Map<String, dynamic> json) {
    return _$DistrictFromJson(json);
  }

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
