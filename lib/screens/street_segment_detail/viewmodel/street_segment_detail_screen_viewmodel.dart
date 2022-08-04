import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

class StreetSegmentDetailScreenViewModel {
  StreetSegments streetSegments;
  bool isSelected;
  bool isLike;

  StreetSegmentDetailScreenViewModel() {
    this.isSelected = false;
    this.isLike = false;
  }

  Future<ResponseServer> getDetailsStreetSegment(
      BuildContext context, String id) async {
    return await getStreetSegmentDetailAPI(context, id);
  }
}
