// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_info_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseInfoField _$ResponseInfoFieldFromJson(Map<String, dynamic> json) {
  return ResponseInfoField(
    json['infoPaging'] == null
        ? null
        : Info.fromJson(json['infoPaging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseInfoFieldToJson(ResponseInfoField instance) =>
    <String, dynamic>{
      'infoPaging': instance.infoPaging,
    };
