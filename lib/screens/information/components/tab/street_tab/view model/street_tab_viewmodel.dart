
import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/requests/street_segments_request/street_segments_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

class StreetTabViewModel {
  List<StreetSegments> streetSegments;
  
  StreetTabViewModel() {
    this.streetSegments = new List();
  }

  Future<ResponseServer> getStreetSegment(BuildContext context, String zoneId) async {
    StreetSegmentsRequest request =
        new StreetSegmentsRequest(0, 0, "", 0, "", zoneId);
    // GeneralHelper.showDialogLoading(context).show();
    return await searchStreetSegment(context, request);
    // searchStreetSegment(context, request).then((res) {
    //   if (res.data.data != null) {
    //     GeneralHelper.showDialogLoading(context).hide();
    //       this.streetSegments = res.data.data;
    //     print(res.data.data);
    //   }
    // });
  }
}