import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/store_detail/store_detail.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

class StoreDetailScreenViewModel {
  List<dynamic> listCheckedService;
  double totalPriceService;
  StoreDetail storeDetail;
  //Widget dropdownSericeWidget;
  List<dynamic> itemServicesData = new List();
  bool isSelected;
  List<dynamic> listCheckSelectedCombo;
  bool isLike;

  StoreDetailScreenViewModel() {
    this.listCheckedService = new List();
    this.totalPriceService = 0.0;
    this.isSelected = false;
    this.listCheckSelectedCombo = new List();
    this.isLike = false;
  }

  Future<ResponseServer> getStoreDetail(BuildContext context, String id) async {
    return await getStoreDetailAPI(context, id);
  }
}
