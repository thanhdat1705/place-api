// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreRequest _$StoreRequestFromJson(Map<String, dynamic> json) {
  return StoreRequest(
    json['limit'] as int,
    json['page'] as int,
    json['sortField'] as String,
    json['sortOrder'] as int,
    json['searchMain'] as String,
    json['zoneId'] as String,
    json['fieldId'] as String,
  );
}

Map<String, dynamic> _$StoreRequestToJson(StoreRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'searchMain': instance.searchMain,
      'zoneId': instance.zoneId,
      'fieldId': instance.fieldId,
    };
