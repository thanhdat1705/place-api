import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/district/district.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  String name;
  String createAt;
  String updateAt;
  String id;
  Province(
    this.name,
    this.createAt,
    this.updateAt,
    this.id,
  );

  Province.instance();
  Province fromJson(Map<String, dynamic> json) {
    return _$ProvinceFromJson(json);
  }

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
