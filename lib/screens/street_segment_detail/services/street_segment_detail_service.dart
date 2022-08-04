import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/street_segment_detail_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

initStreetSegmentDetailScreen(BuildContext context, String id, List<StreetSegments> streetSegments) {
  //GeneralHelper.showDialogLoading(context).show();
  getStreetSegmentDetailAPI(context, id).then(
      (res) {
        //GeneralHelper.showDialogLoading(context).hide();
        GeneralHelper.navigateToScreen(
          context, new StreetSegmentDetailScreen(streetSegmentData: res.data, streetSegments: streetSegments,), false);
      },
    );
}
