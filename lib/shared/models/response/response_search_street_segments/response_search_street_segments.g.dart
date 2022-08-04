// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_search_street_segments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchStreetSegments _$ResponseSearchStreetSegmentsFromJson(
    Map<String, dynamic> json) {
  return ResponseSearchStreetSegments(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : StreetSegments.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseSearchStreetSegmentsToJson(
        ResponseSearchStreetSegments instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
