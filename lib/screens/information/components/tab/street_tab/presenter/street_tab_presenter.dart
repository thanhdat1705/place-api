import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/view%20model/street_tab_viewmodel.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/view/street_tab_view.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/requests/street_segments_request/street_segments_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

abstract class IStreetTabPresenter extends IPresenter {
  StreetTabViewModel get streetTabViewModel;
  IStreetTabView get streetTabView;
  set streetTabViewModel(StreetTabViewModel viewModel);
  set streetTabView(IStreetTabView value);

  List<StreetSegments> getStreetSegmentList();
}

class StreetTabPresenter extends Presenter<IStreetTabView>
    implements IStreetTabPresenter {
  StreetTabViewModel _streetTabViewModel;
  IStreetTabView _streetTabView;

  StreetTabPresenter(BuildContext context, String zoneId) {
    this._streetTabViewModel = new StreetTabViewModel();
    StreetSegmentsRequest request =
        new StreetSegmentsRequest(0, 0, "", 0, "", zoneId);
    // GeneralHelper.showDialogLoading(context).show();
    this.searchStreetSegment(context,zoneId);
  }

  searchStreetSegment(BuildContext context, String zoneId) async {
    ResponseServer responseServer =
        await this._streetTabViewModel.getStreetSegment(context, zoneId);
    //GeneralHelper.showDialogLoading(context).hide();
    this._streetTabViewModel.streetSegments = responseServer.data.data;
    print(responseServer.data.data);
    this._streetTabView.refreshStreetTabService(this._streetTabViewModel);
    
    
  }

  @override
  set streetTabViewModel(StreetTabViewModel viewModel) {
    this._streetTabViewModel = viewModel;
  }

  @override
  StreetTabViewModel get streetTabViewModel {
    return this._streetTabViewModel;
  }

  @override
  IStreetTabView get streetTabView {
    return this._streetTabView;
  }

  @override
  set streetTabView(IStreetTabView value) {
    this._streetTabView = value;
    this._streetTabView.refreshStreetTabService(this._streetTabViewModel);
  }

  @override
  List<StreetSegments> getStreetSegmentList() {
    return this._streetTabViewModel.streetSegments;
  }
}
