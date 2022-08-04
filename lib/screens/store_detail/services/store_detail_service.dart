import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/requests/store_detail_request/store_detail_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

initStoreDetailScreen(BuildContext context, String id) {
  GeneralHelper.showDialogLoading(context).show();
  getStoreDetailAPI(context, id).then(
      (res) {
        GeneralHelper.showDialogLoading(context).hide();
        GeneralHelper.navigateToScreen(
          context, new DetailScreen(storeDetailData: res.data), false);
      },
    );
}
