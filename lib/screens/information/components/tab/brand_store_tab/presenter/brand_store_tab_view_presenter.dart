import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/view%20model/brand_store_tab_viewmodel.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/view/brand_store_tab_view.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';

abstract class IBrandStoreTabPresenter extends IPresenter {
  BrandStoreTabViewModel get brandStoreTabViewModel;
  IBrandStoreTabView get brandStoreTabView;
  set brandStoreTabViewModel(BrandStoreTabViewModel viewModel);
  set brandStoreTabView(IBrandStoreTabView value);

  List<Store> getStoreList();
}

class BrandStoreTabPresenter extends Presenter<IBrandStoreTabView>
    implements IBrandStoreTabPresenter {
  BrandStoreTabViewModel _brandStoreTabViewModel;
  IBrandStoreTabView _brandStoreTabView;

  BrandStoreTabPresenter(BuildContext context, String zoneId, String fieldId) {
    this._brandStoreTabViewModel = new BrandStoreTabViewModel();
    this.searchStore(context, zoneId, fieldId);
  }

  searchStore(BuildContext context, String zoneId, String fieldId) async {
    ResponseServer responseServer = await this
        ._brandStoreTabViewModel
        .searchStoreByZoneId(context, zoneId, fieldId);
    this._brandStoreTabViewModel.storesList = responseServer.data.data;
    print(responseServer.data.data);
    this
        ._brandStoreTabView
        .refreshBrandStoreTabService(this._brandStoreTabViewModel);
  }

  @override
  set brandStoreTabView(IBrandStoreTabView view) {
    this._brandStoreTabView = view;
    this
        ._brandStoreTabView
        .refreshBrandStoreTabService(this._brandStoreTabViewModel);
  }

  @override
  set brandStoreTabViewModel(BrandStoreTabViewModel viewModel) {
    this._brandStoreTabViewModel = viewModel;
  }

  @override
  List<Store> getStoreList() {
    return this._brandStoreTabViewModel.storesList;
  }

  @override
  // TODO: implement streetTabView
  IBrandStoreTabView get brandStoreTabView {
    return this._brandStoreTabView;
  }

  @override
  // TODO: implement streetTabViewModel
  BrandStoreTabViewModel get brandStoreTabViewModel {
    return this._brandStoreTabViewModel;
  }
}
