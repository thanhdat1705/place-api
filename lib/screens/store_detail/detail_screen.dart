import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/shared/models/store_detail/store_detail.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'components/detail_body.dart';
import 'presenter/store_detail_screen_persenter.dart';
import 'view/store_detail_screen_view.dart';
import 'viewmodel/store_detail_screen_viewmodel.dart';

class DetailScreen extends StatefulWidget {
  final StoreDetail storeDetailData;
  final String storeId;
  DetailScreen({Key key, this.storeDetailData, this.storeId}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState
    extends StateView<DetailScreen, IStoreDetailScreenPresenter>
    implements IStoreDetailScreenView {
  @override
  void initState() {
    super.initState();
    this.presenter.storeDetailScreenView = this;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (this.presenter.getStoreDetail() != null) {
      return Scaffold(
        body: new DetailBody(
          address: this.presenter.getStoreDetail().address,
          storeName: this.presenter.getStoreDetail().name,
          description: this.presenter.getStoreDetail().description,
          phone: '0909559559',
          numberOfSeat: this.presenter.getStoreDetail().numberOfSeat.toString(),
          ratingNum: 4.6,
          imageUrl: this.presenter.getStoreDetail().imageUrl,
          utilities: this.presenter.getStoreDetail().utilities,
          avgAmountOfGuest: this.presenter.getStoreDetail().avgAmountOfGuest,
          openTime: this.presenter.getStoreDetail().openTime,
          closeTime: this.presenter.getStoreDetail().closeTime,
          latitude: this.presenter.getStoreDetail().latitude,
          longitude: this.presenter.getStoreDetail().longitude,
          nearStores: this.presenter.getStoreDetail().nearStores,
          id: this.presenter.getStoreDetail().id,
          presenter: this.presenter,
        ),
      );
    } else {
      return new Scaffold(
        body: Center(
          child: SizedBox(
            height: 90,
            width: 90,
            child: new CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
            ),
          ),
        ),
      );
    }
  }

  @override
  IStoreDetailScreenPresenter createPresenter() {
    // getStoreDetail(context);
    return new StoreDetailScreenPresenter(context, this.widget.storeId);
  }

  @override
  void refreshStoreService(StoreDetailScreenViewModel viewModel) {
    setState(() {
      this.presenter.storeDetailScreenViewModel = viewModel;
    });
  }
}
