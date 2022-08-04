import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/components/card/about_card.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_status/street_segment_status.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/shared_components/store_container.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

import '../../street_segment_detail_screen.dart';

class AboutStreet extends StatefulWidget {
  final String title;
  final String street;
  final String address;
  final String ward;
  final String district;
  final String province;
  final String description;
  final String openTime;
  final String closeTime;
  final List<Store> nearStores;
  final List<StreetSegmentStatus> streetSegmentStatuses;
  final List<StreetSegments> streetSegments;
  final String streetSegmentId;

  const AboutStreet({
    Key key,
    this.title,
    this.address,
    this.description,
    this.openTime,
    this.closeTime,
    this.nearStores,
    this.ward,
    this.street,
    this.district,
    this.province,
    this.streetSegmentStatuses,
    this.streetSegments,
    this.streetSegmentId,
  }) : super(key: key);
  @override
  _AboutStreetState createState() => _AboutStreetState();
}

class _AboutStreetState extends State<AboutStreet> {
  List<Widget> itemsData = [];

  List<String> images = [
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_1.jpg",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_2.jpg",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_3.png",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_4.jpg",
  ];

  @override
  void initState() {
    // if (_myActivities == null) {
    //   return;
    // }
    getListStores();
    super.initState();
  }

  // void getListStores() {
  //   List<dynamic> responseList = STORE_DATA;
  //   List<Widget> listStoresData = [];
  //   responseList.forEach((pos) {
  //     listStoresData.add(
  //       StoreContainer(
  //         height: 120,
  //         name: pos["name"],
  //         numberOfSeat: "20",
  //         color: Colors.grey[50],
  //         imageURL: pos["image"],
  //       ),
  //     );
  //   });
  //   setState(() {
  //     itemsData = listStoresData;
  //   });
  // }

  void getListStores() {
    List<Widget> listStoresData = [];
    if (this.widget.nearStores != null) {
      this.widget.nearStores.forEach((cardStore) {
        listStoresData.add(
          StoreContainer(
            height: 120,
            name: cardStore.name,
            numberOfSeat: cardStore.numberOfSeat.toString(),
            color: Colors.grey[50],
            imageURL: cardStore.imageUrl,
            address: cardStore.address,
            description: cardStore.description,
            openTime: cardStore.openTime,
            closeTime: cardStore.closeTime,
            storeId: cardStore.id,
          ),
        );
      });
      setState(() {
        itemsData = listStoresData;
      });
    }
  }

  List<Widget> _streetSegmentRelation(String streetSegmentId) {
    List<Widget> relation = [];
    this.widget.streetSegments.forEach(
      (segment) {
        if (segment.id != streetSegmentId) {
          relation.add(GestureDetector(
            onTap: () {
              GeneralHelper.navigateToScreen(
                    context,
                    new StreetSegmentDetailScreen(
                      streetSegments: this.widget.streetSegments,
                      id: segment.id,
                    ),
                    true);
            },
            child: Container(
                margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),
                    // left: getProportionateScreenWidth(20),
                    // right: getProportionateScreenWidth(20),
                    bottom: getProportionateScreenHeight(15)),
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
                          image: NetworkImage(segment.street.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          segment.street.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          width: getProportionateScreenWidth(160),
                          child: Text(
                            segment.description,
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
          ));
        }
      },
    );
    return relation;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
      ],
    );
  }

  SliverFillRemaining _buildSliverContent() {
    return SliverFillRemaining(
      child: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   child: Text(
              //     this.widget.storeName,
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              //   ),
              // ),
              // SizedBox(height: getProportionateScreenHeight(8)),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/beauty-salon.png",
                      width: 40,
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: getProportionateScreenWidth(85),
                              child: Text(
                                "Street:\t",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                              ),
                            ),
                            Text(
                              this.widget.street,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Row(
                          children: [
                            Container(
                              width: getProportionateScreenWidth(85),
                              child: Text(
                                "Ward:\t",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                              ),
                            ),
                            Text(
                              this.widget.ward,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Row(
                          children: [
                            Container(
                              width: getProportionateScreenWidth(85),
                              child: Text(
                                "District:\t",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                              ),
                            ),
                            Text(
                              this.widget.district,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Row(
                          children: [
                            Container(
                              width: getProportionateScreenWidth(85),
                              child: Text(
                                "Province:\t",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                              ),
                            ),
                            Text(
                              this.widget.province,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              new AboutCard(
                description: this.widget.description,
                phone: "090999",
                openTime: this.widget.openTime,
                closeTime: this.widget.closeTime,
                streetSegmentStatuses: this.widget.streetSegmentStatuses,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                // color: Colors.red,
                // margin: EdgeInsets.only(
                //     left: getProportionateScreenWidth(20)),
                child: Text(
                  "Relation",
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    this._streetSegmentRelation(this.widget.streetSegmentId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
