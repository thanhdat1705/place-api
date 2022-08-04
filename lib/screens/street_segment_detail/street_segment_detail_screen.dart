import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'components/street_segment_detail_body.dart';
import 'presenter/street_segment_detail_screen_persenter.dart';
import 'view/street_segment_detail_screen_view.dart';
import 'viewmodel/street_segment_detail_screen_viewmodel.dart';

class StreetSegmentDetailScreen extends StatefulWidget {
  final StreetSegments streetSegmentData;
  final List<StreetSegments> streetSegments;
  final String id;
  StreetSegmentDetailScreen(
      {Key key, this.streetSegmentData, this.streetSegments, this.id})
      : super(key: key);

  @override
  _StreetSegmentDetailScreenState createState() =>
      _StreetSegmentDetailScreenState();
}

class _StreetSegmentDetailScreenState extends StateView<
        StreetSegmentDetailScreen, IStreetSegmentDetailScreenPresenter>
    implements IStreetSegmentDetailScreenView {
  @override
  void initState() {
    super.initState();
    this.presenter.streetSegmentDetailScreenView = this;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (this.presenter.getStreetSegmentDetail() != null) {
      return Scaffold(
        body: new StreetSegmentDetailBody(
          // address: this.presenter.getStreetSegmentDetail().street.name,
          street: this.presenter.getStreetSegmentDetail().street.name,
          ward: this.presenter.getStreetSegmentDetail().ward.name,
          district: this.presenter.getStreetSegmentDetail().ward.district.name,
          province: this
              .presenter
              .getStreetSegmentDetail()
              .ward
              .district
              .province
              .name,
          streetSegmentStatuses:
              this.presenter.getStreetSegmentDetail().streetSegmentStatuses,
          description: this.presenter.getStreetSegmentDetail().description,
          id: this.presenter.getStreetSegmentDetail().id,
          streetSegments: this.widget.streetSegments,
          // phone: '0909559559',
          // numberOfSeat: this.presenter.getStreetSegmentDetail().numberOfSeat.toString(),
          // ratingNum: 4.6,
          imageUrl: this.presenter.getStreetSegmentDetail().street.imageUrl,
          streetSegmentPath:
              this.presenter.getStreetSegmentDetail().streetSegmentPath,
          // utilities: this.presenter.getStreetSegmentDetail().utilities,
          // avgAmountOfGuest: this.presenter.getStreetSegmentDetail().avgAmountOfGuest,
          // openTime: this.presenter.getStreetSegmentDetail().openTime,
          // closeTime: this.presenter.getStreetSegmentDetail().closeTime,
          // latitude: this.presenter.getStreetSegmentDetail().latitude,
          // longitude: this.presenter.getStreetSegmentDetail().longitude,
          // nearStores: this.presenter.getStreetSegmentDetail().nearStores,
          // id: this.presenter.getStreetSegmentDetail().id,
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
              valueColor : AlwaysStoppedAnimation(Colors.purpleAccent),
            ),
          ),
        ),
      );
    }
  }

  @override
  IStreetSegmentDetailScreenPresenter createPresenter() {
    // getStoreDetail(context);
    return new StreetSegmentDetailScreenPresenter(context, this.widget.id);
  }

  @override
  void refreshStreetSegmentService(
      StreetSegmentDetailScreenViewModel viewModel) {
    setState(() {
      this.presenter.streetSegmentDetailScreenViewModel = viewModel;
    });
  }
}
