// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_search_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSearchStore _$ResponseSearchStoreFromJson(Map<String, dynamic> json) {
  return ResponseSearchStore(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Store.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseSearchStoreToJson(
        ResponseSearchStore instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
