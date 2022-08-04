// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street_segments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreetSegmentsRequest _$StreetSegmentsRequestFromJson(
    Map<String, dynamic> json) {
  return StreetSegmentsRequest(
    json['limit'] as int,
    json['page'] as int,
    json['sortField'] as String,
    json['sortOrder'] as int,
    json['searchMain'] as String,
    json['zoneId'] as String,
  );
}

Map<String, dynamic> _$StreetSegmentsRequestToJson(
        StreetSegmentsRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'searchMain': instance.searchMain,
      'zoneId': instance.zoneId,
    };
