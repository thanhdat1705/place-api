import 'package:json_annotation/json_annotation.dart';

part 'street.g.dart';

@JsonSerializable()
class Street {
  String name;
  String imageUrl;
  String id;
  Street(this.name, this.imageUrl, this.id);

  Street.instance();
  Street fromJson(Map<String, dynamic> json) {
    return _$StreetFromJson(json);
  }

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);
  Map<String, dynamic> toJson() => _$StreetToJson(this);
}
