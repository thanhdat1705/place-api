import 'package:json_annotation/json_annotation.dart';
//import 'package:mapper/mapper.dart';

part 'auth_request.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class AuthRequest {
  String accessToken;
  String firebaseMessagingToken;
  int provider; //google = 1; facebook=0

  AuthRequest({this.accessToken, this.provider,this.firebaseMessagingToken});

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
