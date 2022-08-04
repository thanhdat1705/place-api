
import 'package:json_annotation/json_annotation.dart';
//import 'package:mapper/mapper.dart';
part "fields.g.dart";


//@Entity(fullMatch: true)
@JsonSerializable()
class Field {
  String name;
  String description;
  String iconUrl;
  String id;

  Field(this.name, this.description, this.iconUrl, this.id);

  Field.instance();
  Field fromJson(Map<String, dynamic> json) {
    return _$FieldFromJson(json);
  }

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}
