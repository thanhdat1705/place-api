import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/home/home_screen.dart';
import 'package:project_places_api_mobile/screens/splash/splash_screen.dart';
import 'package:project_places_api_mobile/screens/store_detail/components/tab/review_page.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/components/tab/about_street.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/components/tab/location_street.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/presenter/street_segment_detail_screen_persenter.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_status/street_segment_status.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

//List<dynamic> globalListService = new List();

class StreetSegmentDetailBody extends StatefulWidget {
  final IStreetSegmentDetailScreenPresenter presenter;
  final String street;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final String numberOfSeat;
  final String imageUrl;
  final String openTime;
  final String closeTime;
  final double avgAmountOfGuest;
  final List<String> utilities;
  final double latitude;
  final double longitude;
  final String id;
  final List<Store> nearStores;
  final String ward;
  final String district;
  final String province;
  final List<StreetSegmentStatus> streetSegmentStatuses;
  final List<StreetSegments> streetSegments;
  final String streetSegmentPath;
  
  StreetSegmentDetailBody({
    Key key,
    this.street,
    this.address = "zxc",
    this.phone = "0909",
    this.description,
    this.ratingNum = 4.7,
    this.numberOfSeat = "50",
    this.presenter,
    this.imageUrl,
    this.openTime = "06:00",
    this.closeTime = "23:00",
    this.avgAmountOfGuest = 0.5,
    this.utilities,
    this.latitude = 10.84561,
    this.longitude = 106.809516,
    this.nearStores,
    this.id,
    this.ward,
    this.district,
    this.province,
    this.streetSegmentStatuses, this.streetSegments, this.streetSegmentPath,
  }) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

typedef Offset OffsetHandle(Animation animation);
enum MenuOption { Home, Call, Cancel }

class _DetailBodyState extends State<StreetSegmentDetailBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  List<Tuple3> tabList;
  bool lastStatus = true;
  // bool _isLike = false;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  // void checkStoreFollowing() {
  //   List<dynamic> storeFollowing = MemoryStorage.get('FollowingStore');
  //   if (storeFollowing != null &&
  //       storeFollowing.any((following) => following == this.widget.id)) {
  //     // setState(() {
  //       this.widget.presenter.streetSegmentDetailScreenViewModel.isLike = true;
  //     // });
  //   } else {
  //     // setState(() {
  //       this.widget.presenter.streetSegmentDetailScreenViewModel.isLike = false;
  //     // });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // checkStoreFollowing();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    this.tabList = [
      Tuple3(
          'About',
          AboutStreet(
            street: this.widget.street,
            address: this.widget.address,
            description: this.widget.description,
            openTime: this.widget.openTime,
            closeTime: this.widget.closeTime,
            nearStores: this.widget.nearStores,
            ward: this.widget.ward,
            district: this.widget.district,
            province: this.widget.province,
            streetSegmentStatuses: this.widget.streetSegmentStatuses,
            streetSegments: this.widget.streetSegments,
            streetSegmentId: this.widget.id,
          ),
          Icon(Icons.description_outlined,
              size: getProportionateScreenHeight(16))),
      // Tuple3(
      //     'Service',
      //     ServicePage(presenter: this.widget.presenter),
      //     Icon(Icons.local_mall_outlined,
      //         size: getProportionateScreenHeight(16))),
      Tuple3(
          'Location',
          LocationStreet(
            address: this.widget.address,
            openTime: this.widget.openTime,
            closeTime: this.widget.closeTime,
            latitude: this.widget.latitude,
            longitude: this.widget.longitude,
            ward: this.widget.ward,
            district: this.widget.district,
            province: this.widget.province,
            street: this.widget.street,
            streetSegmentPath: this.widget.streetSegmentPath,
          ),
          Icon(Icons.location_on_outlined,
              size: getProportionateScreenHeight(16))),
      Tuple3('Report', ReviewPage(),
          Icon(Icons.show_chart, size: getProportionateScreenHeight(16))),
    ];
    _tabController = TabController(length: this.tabList.length, vsync: this);
    // this._tabController.addListener(() {
    //   setState(() {});.
    // });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: this.tabList.length,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    // centerTitle: true,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.teal[100],
                    expandedHeight: getProportionateScreenHeight(180),
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    leading: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.keyboard_arrow_left_outlined),
                      color: isShrink ? Colors.black : Colors.white,
                      iconSize: 33,
                      alignment: Alignment(1, 0.0),
                      onPressed: () {
                        Navigator.pop(context);
                        print('clicked back');
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      // centerTitle: true,
                      // titlePadding: EdgeInsets.only(left: getProportionateScreenWidth(70), bottom: 17),
                      title: Text(
                        this.widget.street,
                        style: TextStyle(
                            color: isShrink ? Colors.black : Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      background: Image.network(
                        this.widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    actions: <Widget>[
                      // Padding(
                      //   padding: EdgeInsets.only(left: 0.0),
                      //   child: IconButton(
                      //     splashColor: Colors.transparent,
                      //     onPressed: () async {
                      //       // postFollowingStoreAPI(context, this.widget.id)
                      //       // .then((value) {
                      //       await this
                      //           .widget
                      //           .presenter
                      //           .clickLike(context, this.widget.id);
                      //       // if (!this._isLike) {
                      //       //   setState(() {
                      //       //     this._isLike = true;
                      //       //   });
                      //       // } else {
                      //       //   setState(() {
                      //       //     this._isLike = false;
                      //       //   });
                      //       // }
                      //       // });
                      //     },
                      //     icon: Icon(
                      //         this.widget.presenter.getLike()
                      //             ? Icons.favorite
                      //             : Icons.favorite_border,
                      //         color: this.widget.presenter.getLike()
                      //             ? Colors.redAccent
                      //             : isShrink
                      //                 ? Colors.black
                      //                 : Colors.white,
                      //         size: 23.0),
                      //   ),
                      // ),

                      Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: PopupMenuButton<MenuOption>(
                            onSelected: (value) {
                              if (value == MenuOption.Home) {
                              } else if (value == MenuOption.Call) {
                                launchUrl('tel:' + this.widget.phone);
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )),
                            color: Colors.blue[100],
                            icon: Icon(
                              Icons.more_vert_outlined,
                              color: isShrink ? Colors.black : Colors.white,
                            ),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<MenuOption>>[
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(Icons.home_outlined),
                                      Text("Home"),
                                    ],
                                  ),
                                  value: MenuOption.Home,
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(Icons.call),
                                      Text("Call"),
                                    ],
                                  ),
                                  value: MenuOption.Call,
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(Icons.cancel_outlined),
                                      Text("Cancel"),
                                    ],
                                  ),
                                  value: MenuOption.Cancel,
                                ),
                              ];
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.blue[500],
                labelPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(5)),
                indicatorColor: Colors.blue[500],
                controller: _tabController,
                tabs: this
                    .tabList
                    .map<Tab>((Tuple3 page) => Tab(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            page.item3,
                            Text(
                              page.item1,
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(16)),
                            ),
                          ],
                        )))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: this
                      .tabList
                      .map<Widget>((Tuple3 page) => page.item2)
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
