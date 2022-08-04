import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/zones/zone.dart';

part 'respone_search_zone.g.dart';

@JsonSerializable()
class ResponseSearchZone {
  List<Zone> data;
  ResponseSearchZone(this.data);

  ResponseSearchZone.instance();
  ResponseSearchZone fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchZoneFromJson(json);
  }

  factory ResponseSearchZone.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchZoneToJson(this);
}
