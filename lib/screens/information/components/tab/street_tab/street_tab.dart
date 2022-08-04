import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/presenter/street_tab_presenter.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/view%20model/street_tab_viewmodel.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/view/street_tab_view.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/services/street_segment_detail_service.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/street_segment_detail_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/street/street.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/requests/street_segments_request/street_segments_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class StreetTab extends StatefulWidget {
  final String zoneId;
  StreetTab({Key key, this.zoneId}) : super(key: key);
  @override
  _StreetTabState createState() => _StreetTabState();
}

class _StreetTabState extends StateView<StreetTab, IStreetTabPresenter>
    implements IStreetTabView {
  // List<StreetSegments> streetSegments;
  @override
  void initState() {
    super.initState();
    this.presenter.streetTabView = this;
  }

  @override
  Widget build(BuildContext context) {
    if (this.presenter.streetTabViewModel.streetSegments.length == 0) {
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
    } else {
      return SafeArea(
        child: Container(
          // width: SizeConfig.screenWidth,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: this.presenter.streetTabViewModel.streetSegments.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Street street = this
                  .presenter
                  .streetTabViewModel
                  .streetSegments[index]
                  .street;
              StreetSegments streetSegment =
                  this.presenter.streetTabViewModel.streetSegments[index];
              return GestureDetector(
                onTap: () {
                  GeneralHelper.navigateToScreen(
                      context,
                      new StreetSegmentDetailScreen(
                        streetSegments:
                            this.presenter.streetTabViewModel.streetSegments,
                        id: streetSegment.id,
                      ),
                      false);
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(20),
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(20),
                        bottom: getProportionateScreenHeight(5)),
                    height: getProportionateScreenHeight(100),
                    width: SizeConfig.screenWidth,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(150),
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(street.imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              street.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                            Container(
                              width: getProportionateScreenWidth(160),
                              child: Text(
                                streetSegment.description,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800]),
                              ),
                            ),
                            // Container(width: 180, child: Text(streetSegment.pointStart, maxLines: 2,),)
                          ],
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  IStreetTabPresenter createPresenter() {
    return new StreetTabPresenter(context, this.widget.zoneId);
  }

  @override
  void refreshStreetTabService(StreetTabViewModel viewModel) {
    setState(() {
      this.presenter.streetTabViewModel = viewModel;
    });
  }
}
