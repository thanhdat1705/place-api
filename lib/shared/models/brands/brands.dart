import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/brand_field/brand_field.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
//import 'package:mapper/mapper.dart';

part 'brands.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class Brand {
  String name;
  String description;
  String iconUrl;
  String imageUrl;
  List<BrandField> brandFields;
  String id;
  List<Store> stores;
  

  Brand(this.name, this.description, this.iconUrl, this.imageUrl,
      this.brandFields, this.id);
  Brand.instance();
  Brand fromJson(Map<String, dynamic> json) {
    return _$BrandFromJson(json);
  }

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
