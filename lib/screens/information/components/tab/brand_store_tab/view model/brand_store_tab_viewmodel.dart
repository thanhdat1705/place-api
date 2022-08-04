import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/requests/store_request/store_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

class BrandStoreTabViewModel {
  List<Store> storesList;

  BrandStoreTabViewModel() {
    this.storesList = new List();
  }

  Future<ResponseServer> searchStoreByZoneId(BuildContext context, String zoneId, String fieldId) async {
    StoreRequest request = new StoreRequest(0, 0, "", 0, "", zoneId, fieldId);
    return await searchStore(context, request);
  }
}
