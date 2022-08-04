// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) {
  return AuthRequest(
    accessToken: json['accessToken'] as String,
    provider: json['provider'] as int,
    firebaseMessagingToken: json['firebaseMessagingToken'] as String,
  );
}

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'firebaseMessagingToken': instance.firebaseMessagingToken,
      'provider': instance.provider,
    };
