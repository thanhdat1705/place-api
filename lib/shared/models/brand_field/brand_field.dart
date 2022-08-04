import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/fields/fields.dart';
part 'brand_field.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class BrandField {
  String brandId;
  String fieldId;
  Field field;

  BrandField(this.brandId, this.fieldId, this.field);
  BrandField.instance();
  BrandField fromJson(Map<String, dynamic> json) {
    return _$BrandFieldFromJson(json);
  }

  factory BrandField.fromJson(Map<String, dynamic> json) =>
      _$BrandFieldFromJson(json);
  // Map<String, dynamic> toJson() => _$BrandFieldToJson(this);
}
