// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_search_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchField _$ResponseSearchFieldFromJson(Map<String, dynamic> json) {
  return ResponseSearchField(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseSearchFieldToJson(
        ResponseSearchField instance) =>
    <String, dynamic>{
      'data': instance.data,
      'info': instance.info,
    };
