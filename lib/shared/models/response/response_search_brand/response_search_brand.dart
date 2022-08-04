import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brands/brands.dart';
part 'response_search_brand.g.dart';

@JsonSerializable()
class ResponseSearchBrand {
  List<Brand> data;
  ResponseSearchBrand(this.data);

  ResponseSearchBrand.instance();
  ResponseSearchBrand fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchBrandFromJson(json);
  }

  factory ResponseSearchBrand.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchBrandFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchBrandToJson(this);
}
