import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/view/street_segment_detail_screen_view.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/viewmodel/street_segment_detail_screen_viewmodel.dart';

import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';

abstract class IStreetSegmentDetailScreenPresenter extends IPresenter {
  StreetSegmentDetailScreenViewModel get streetSegmentDetailScreenViewModel;

  set streetSegmentDetailScreenViewModel(
      StreetSegmentDetailScreenViewModel viewModel);

  IStreetSegmentDetailScreenView get streetSegmentDetailScreenView;
  StreetSegments getStreetSegmentDetail();

  set streetSegmentDetailScreenView(IStreetSegmentDetailScreenView value);
  Future clickLike(BuildContext context, String id);
  bool getLike();
}

class StreetSegmentDetailScreenPresenter
    extends Presenter<IStreetSegmentDetailScreenView>
    implements IStreetSegmentDetailScreenPresenter {
  StreetSegmentDetailScreenViewModel _streetSegmentDetailScreenViewModel;
  IStreetSegmentDetailScreenView _streetSegmentDetailScreenView;
  StreetSegmentDetailScreenPresenter(BuildContext context, String id) {
    this._streetSegmentDetailScreenViewModel =
        new StreetSegmentDetailScreenViewModel();
    this.getDetails(context,id); 
  }

  getDetails(BuildContext context, String id) async {
    ResponseServer responseServer = await this
        ._streetSegmentDetailScreenViewModel
        .getDetailsStreetSegment(context, id);
    this._streetSegmentDetailScreenViewModel.streetSegments =
        responseServer.data;
    this
        ._streetSegmentDetailScreenView
        .refreshStreetSegmentService(this.streetSegmentDetailScreenViewModel);
  }

  @override
  StreetSegments getStreetSegmentDetail() {
    return this._streetSegmentDetailScreenViewModel.streetSegments;
  }

  @override
  set streetSegmentDetailScreenView(IStreetSegmentDetailScreenView value) {
    this._streetSegmentDetailScreenView = value;
    this
        ._streetSegmentDetailScreenView
        .refreshStreetSegmentService(this._streetSegmentDetailScreenViewModel);
  }

  @override
  IStreetSegmentDetailScreenView get streetSegmentDetailScreenView {
    return this._streetSegmentDetailScreenView;
  }

  @override
  StreetSegmentDetailScreenViewModel get streetSegmentDetailScreenViewModel {
    return this._streetSegmentDetailScreenViewModel;
  }

  @override
  set streetSegmentDetailScreenViewModel(
      StreetSegmentDetailScreenViewModel viewModel) {
    this._streetSegmentDetailScreenViewModel = viewModel;
  }

  @override
  Future clickLike(BuildContext context, String id) async {
    ResponseServer responseServer = await postFollowingStoreAPI(context, id);
    List<dynamic> followStore = MemoryStorage.get("FollowingStore");

    followStore = responseServer.data;
    MemoryStorage.set("FollowingStore", followStore);
    this._streetSegmentDetailScreenViewModel.isLike =
        !this._streetSegmentDetailScreenViewModel.isLike;
    this
        ._streetSegmentDetailScreenView
        .refreshStreetSegmentService(this._streetSegmentDetailScreenViewModel);
  }

  @override
  bool getLike() {
    return this._streetSegmentDetailScreenViewModel.isLike;
  }
}
