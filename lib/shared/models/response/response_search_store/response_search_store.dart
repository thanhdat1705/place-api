import 'package:json_annotation/json_annotation.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';

part 'response_search_store.g.dart';

@JsonSerializable()
class ResponseSearchStore {
  List<Store> data;
  ResponseSearchStore(this.data);

  ResponseSearchStore.instance();
  ResponseSearchStore fromJson(Map<String, dynamic> json) {
    return _$ResponseSearchStoreFromJson(json);
  }

  factory ResponseSearchStore.fromJson(Map<String, dynamic> json) =>
      _$ResponseSearchStoreFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseSearchStoreToJson(this);
}
