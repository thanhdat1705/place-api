//import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
//import 'package:mapper/mapper.dart';
import 'package:project_places_api_mobile/shared/models/fields/fields.dart';
import 'package:project_places_api_mobile/shared/models/paging/info.dart';

part 'respone_search_field.g.dart';


//@Entity(fullMatch: true)
@JsonSerializable()
class ResponseSearchField {
  List<Field> data;
  Info info;
  ResponseSearchField(this.data, this.info);

  ResponseSearchField.instance();
  ResponseSearchField fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchFieldFromJson(json);
  }

  factory ResponseSearchField.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchFieldFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchFieldToJson(this);
}
