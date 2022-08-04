import 'package:json_annotation/json_annotation.dart';
part 'street_segments_request.g.dart';

@JsonSerializable()
class StreetSegmentsRequest {
  int limit;
  int page;
  String sortField;
  int sortOrder;
  String searchMain;
  String zoneId;

  StreetSegmentsRequest(
      this.limit,
      this.page,
      this.sortField,
      this.sortOrder,
      this.searchMain,
      this.zoneId);

  Map<String, dynamic> toJson() => _$StreetSegmentsRequestToJson(this);
}
