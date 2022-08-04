import 'package:json_annotation/json_annotation.dart';
//import 'package:mapper/mapper.dart';

part 'account.g.dart';

//@Entity(fullMatch: true)
@JsonSerializable()
class Account {
  String accountId;
  String phoneNumber;
  String email;
  String photoUrl;
  String displayName;
  String token;
  String description;
  int provider;
  int role;
  List<String> followingStore;

  Account(this.accountId, this.phoneNumber, this.email, this.photoUrl,
      this.displayName, this.token, this.description, this.provider, this.role, this.followingStore);
  Account.instance();
  Account fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
