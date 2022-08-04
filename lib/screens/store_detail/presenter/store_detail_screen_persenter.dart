import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/data/service_list.dart';
import 'package:project_places_api_mobile/screens/store_detail/view/store_detail_screen_view.dart';
import 'package:project_places_api_mobile/screens/store_detail/viewmodel/store_detail_screen_viewmodel.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/store_detail/store_detail.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';

abstract class IStoreDetailScreenPresenter extends IPresenter {
  StoreDetailScreenViewModel get storeDetailScreenViewModel;
  set storeDetailScreenViewModel(StoreDetailScreenViewModel viewModel);

  IStoreDetailScreenView get storeDetailScreenView;
  StoreDetail getStoreDetail();

  set storeDetailScreenView(IStoreDetailScreenView value);

  Future clickLike(BuildContext context, String id);
  bool getLike();
}

class StoreDetailScreenPresenter extends Presenter<IStoreDetailScreenView>
    implements IStoreDetailScreenPresenter {
  StoreDetailScreenViewModel _storeDetailScreenViewModel;
  IStoreDetailScreenView _storeDetailScreenView;
  StoreDetailScreenPresenter(BuildContext context, String id) {
    this._storeDetailScreenViewModel = new StoreDetailScreenViewModel();
    this.getDetails(context, id);
  }

  getDetails(BuildContext context, String id) async {
    ResponseServer responseServer =
        await this._storeDetailScreenViewModel.getStoreDetail(context, id);
    this._storeDetailScreenViewModel.storeDetail = responseServer.data;
    this
        ._storeDetailScreenView
        .refreshStoreService(this.storeDetailScreenViewModel);
  }

  @override
  StoreDetail getStoreDetail() {
    return this._storeDetailScreenViewModel.storeDetail;
  }

  @override
  set storeDetailScreenView(IStoreDetailScreenView value) {
    this._storeDetailScreenView = value;
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  IStoreDetailScreenView get storeDetailScreenView {
    return this._storeDetailScreenView;
  }

  @override
  StoreDetailScreenViewModel get storeDetailScreenViewModel {
    return this._storeDetailScreenViewModel;
  }

  @override
  set storeDetailScreenViewModel(StoreDetailScreenViewModel viewModel) {
    this._storeDetailScreenViewModel = viewModel;
  }

  @override
  Future clickLike(BuildContext context, String id) async {
    ResponseServer responseServer = await postFollowingStoreAPI(context, id);
    List<dynamic> followStore = MemoryStorage.get("FollowingStore");

    followStore = responseServer.data;
    MemoryStorage.set("FollowingStore", followStore);
    this._storeDetailScreenViewModel.isLike =
        !this._storeDetailScreenViewModel.isLike;
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  bool getLike() {
    return this._storeDetailScreenViewModel.isLike;
  }
}
