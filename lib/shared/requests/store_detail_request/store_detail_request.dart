import 'package:json_annotation/json_annotation.dart';
part 'store_detail_request.g.dart';

@JsonSerializable()
class StoreDetailRequest {
  String id;

  StoreDetailRequest(this.id);

  Map<String, dynamic> toJson() => _$StoreDetailRequestToJson(this);
}
