// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) {
  return SearchRequest(
    json['limit'] as int,
    json['page'] as int,
    json['sortField'] as String,
    json['sortOrder'] as int,
    json['searchMain'] as String,
  );
}

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'searchMain': instance.searchMain,
    };
