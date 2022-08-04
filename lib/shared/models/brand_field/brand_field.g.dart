// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandField _$BrandFieldFromJson(Map<String, dynamic> json) {
  return BrandField(
    json['brandId'] as String,
    json['fieldId'] as String,
    json['field'] == null
        ? null
        : Field.fromJson(json['field'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BrandFieldToJson(BrandField instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'fieldId': instance.fieldId,
      'field': instance.field,
    };
