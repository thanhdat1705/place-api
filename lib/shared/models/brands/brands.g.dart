// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    json['name'] as String,
    json['description'] as String,
    json['iconUrl'] as String,
    json['imageUrl'] as String,
    (json['brandFields'] as List)
        ?.map((e) =>
            e == null ? null : BrandField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['id'] as String,
  )..stores = (json['stores'] as List)
      ?.map((e) => e == null ? null : Store.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'imageUrl': instance.imageUrl,
      'brandFields': instance.brandFields,
      'id': instance.id,
      'stores': instance.stores,
    };
