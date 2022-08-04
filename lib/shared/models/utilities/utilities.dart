import 'package:json_annotation/json_annotation.dart';

part 'utilities.g.dart';

@JsonSerializable()
class Utilities {
  String name;
  String iconUrl;
  String id;
  Utilities(
    this.name,
    this.iconUrl,
    this.id,
  );

  Utilities.instance();
  Utilities fromJson(Map<String, dynamic> json) {
    return _$UtilitiesFromJson(json);
  }

  factory Utilities.fromJson(Map<String, dynamic> json) =>
      _$UtilitiesFromJson(json);
  Map<String, dynamic> toJson() => _$UtilitiesToJson(this);
}
