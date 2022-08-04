// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    json['name'] as String,
    json['description'] as String,
    json['iconUrl'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'id': instance.id,
    };
