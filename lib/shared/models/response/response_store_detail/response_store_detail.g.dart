// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_store_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStoreDetail _$ResponseStoreDetailFromJson(Map<String, dynamic> json) {
  return ResponseStoreDetail(
    json['storeDetail'] == null
        ? null
        : StoreDetail.fromJson(json['storeDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseStoreDetailToJson(
        ResponseStoreDetail instance) =>
    <String, dynamic>{
      'storeDetail': instance.storeDetail,
    };
