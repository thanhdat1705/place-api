// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['accountId'] as String,
    json['phoneNumber'] as String,
    json['email'] as String,
    json['photoUrl'] as String,
    json['displayName'] as String,
    json['token'] as String,
    json['description'] as String,
    json['provider'] as int,
    json['role'] as int,
    (json['followingStore'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'displayName': instance.displayName,
      'token': instance.token,
      'description': instance.description,
      'provider': instance.provider,
      'role': instance.role,
      'followingStore': instance.followingStore,
    };
