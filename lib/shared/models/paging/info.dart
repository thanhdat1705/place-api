import 'package:json_annotation/json_annotation.dart';
//import 'package:mapper/mapper.dart';

part 'info.g.dart';

@JsonSerializable()
//@Entity(fullMatch: true)
class Info {
  int limit;
  int page;
  int totalRecord;

  Info(this.limit, this.page, this.totalRecord);

  Info.instance();
  Info fromJson(Map<String, dynamic> json) {
    return _$InfoFromJson(json);
  }

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
