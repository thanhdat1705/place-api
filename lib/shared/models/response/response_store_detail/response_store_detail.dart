import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/store_detail/store_detail.dart';

part 'response_store_detail.g.dart';

@JsonSerializable()
class ResponseStoreDetail {
  StoreDetail storeDetail;
  ResponseStoreDetail(this.storeDetail);

  ResponseStoreDetail.instance();
  ResponseStoreDetail fromJson(Map<String, dynamic> json) {
    return _$ResponseStoreDetailFromJson(json);
  }

  factory ResponseStoreDetail.fromJson(Map<String, dynamic> json) =>
      _$ResponseStoreDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseStoreDetailToJson(this);
}
