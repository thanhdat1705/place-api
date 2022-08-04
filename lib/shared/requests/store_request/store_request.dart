import 'package:json_annotation/json_annotation.dart';
part 'store_request.g.dart';

@JsonSerializable()
class StoreRequest {
  int limit;
  int page;
  String sortField;
  int sortOrder;
  String searchMain;
  String zoneId;
  String fieldId;

  StoreRequest(this.limit, this.page, this.sortField, this.sortOrder,
      this.searchMain, this.zoneId, this.fieldId);

  Map<String, dynamic> toJson() => _$StoreRequestToJson(this);
}
