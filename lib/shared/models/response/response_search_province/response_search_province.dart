import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/provinces/province.dart';

part 'response_search_province.g.dart';

@JsonSerializable()
class ResponseSearchProvince {
  List<Province> data;
  ResponseSearchProvince(this.data);

  ResponseSearchProvince.instance();
  ResponseSearchProvince fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchProvinceFromJson(json);
  }

  factory ResponseSearchProvince.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchProvinceToJson(this);
}
