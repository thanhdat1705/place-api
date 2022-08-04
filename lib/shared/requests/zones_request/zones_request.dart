import 'package:json_annotation/json_annotation.dart';
part 'zones_request.g.dart';

@JsonSerializable()
class ZonesRequest {
  int limit;
  int page;
  String sortField;
  int sortOrder;
  String searchMain;
  double latitude;
  double longitude;
  String address;
  int searchBy;

  ZonesRequest(
      this.limit,
      this.page,
      this.sortField,
      this.sortOrder,
      this.searchMain,
      this.latitude,
      this.longitude,
      this.address,
      this.searchBy);

  Map<String, dynamic> toJson() => _$ZonesRequestToJson(this);
}
