// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_search_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchBrand _$ResponseSearchBrandFromJson(Map<String, dynamic> json) {
  return ResponseSearchBrand(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Brand.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseSearchBrandToJson(
        ResponseSearchBrand instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
