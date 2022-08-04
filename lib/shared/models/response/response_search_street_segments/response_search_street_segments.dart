import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';

part 'response_search_street_segments.g.dart';

@JsonSerializable()
class ResponseSearchStreetSegments {
  List<StreetSegments> data;
  ResponseSearchStreetSegments(this.data);

  ResponseSearchStreetSegments.instance();
  ResponseSearchStreetSegments fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchStreetSegmentsFromJson(json);
  }

  factory ResponseSearchStreetSegments.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchStreetSegmentsFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchStreetSegmentsToJson(this);
}
