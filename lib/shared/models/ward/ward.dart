import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/district/district.dart';

part 'ward.g.dart';

@JsonSerializable()
class Ward {
  String name;
  String districtId;
  String createAt;
  String updateAt;
  District district;
  String id;
  Ward(
    this.name,
    this.districtId,
    this.createAt,
    this.updateAt,
    this.district,
    this.id,
  );

  Ward.instance();
  Ward fromJson(Map<String, dynamic> json) {
    return _$WardFromJson(json);
  }

  factory Ward.fromJson(Map<String, dynamic> json) =>
      _$WardFromJson(json);
  Map<String, dynamic> toJson() => _$WardToJson(this);
}
