import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:project_places_api_mobile/screens/home/models/Point.dart';
import 'package:project_places_api_mobile/screens/information/information_screen.dart';
import 'package:project_places_api_mobile/screens/profile/profile_screen.dart';
import 'package:project_places_api_mobile/screens/splash/splash_screen.dart';
import 'package:project_places_api_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/fields/fields.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/store_zones/store_zones.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_zones/street_segment_zone.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/models/zones/zone.dart';
import 'package:project_places_api_mobile/shared/requests/search_request/search_request.dart';
import 'package:project_places_api_mobile/shared/requests/store_request/store_request.dart';
import 'package:project_places_api_mobile/shared/requests/street_segments_request/street_segments_request.dart';
import 'package:project_places_api_mobile/shared/requests/zones_request/zones_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:project_places_api_mobile/widgets/button/icon_btn_with_counter.dart';
import 'package:project_places_api_mobile/widgets/popup/loading_overlay.dart';

class HomeMap extends StatefulWidget {
  final Account userAccountData;

  const HomeMap(this.userAccountData, {Key key}) : super(key: key);
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  //Declare
  final _searchPlaceController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleMapController _controller;
  String _inputValue = '';
  List<LatLng> pointss = List<LatLng>();
  List<LatLng> tmp = List<LatLng>();
  LatLng currentTap = new LatLng(0.0, 0.0);
  CarouselController carouselController;
  String currentZoneId = '';
  String currentFieldId = '';
  List<Zone> zones = new List<Zone>();
  List<Field> fieldsList = new List<Field>();
  List<Store> storesList = new List<Store>();
  final Geolocator _geolocator = Geolocator();
  Position _userCurrentPosition = new Position();

  List<StreetSegmentZone> streetSegmentZones = new List<StreetSegmentZone>();
  BitmapDescriptor customIcon;
  List<Point> listPoint = new List<Point>();
  List<StreetSegment> streetSegmentList = new List<StreetSegment>();

  List<StreetSegments> streetSegments = new List<StreetSegments>();

  bool isSearchZone = false;

  List<Polygon> allPolygon = [
    // Polygon(
    //   polygonId: PolygonId(2.toString()),
    //   strokeWidth: 1,
    //   points: [
    //     // LatLng(10.844171, 106.808652),
    //     // LatLng(10.843677, 106.809935),
    //     // LatLng(10.843587, 106.810066),
    //     // LatLng(10.843002, 106.810621),
    //     // LatLng(10.842936, 106.810720),
    //     // LatLng(10.842385, 106.812002),
    //     // LatLng(10.842143, 106.812281),
    //     // LatLng(10.841166, 106.812764),
    //     // LatLng(10.840794, 106.813152),
    //     // //---------------------------
    //     // LatLng(10.839544, 106.811961),
    //     // LatLng(10.839518, 106.811097),
    //     // //---------------------------
    //     // LatLng(10.843252, 106.807179),
    //     // //---------------------------
    //     // LatLng(10.844041, 106.807968),
    //     // LatLng(10.844184, 106.808204),
    //     // LatLng(10.844205, 106.808467),
    //   ],
    //   // points: path,
    //   fillColor: Colors.amberAccent.withOpacity(0.5),
    // ),
  ];
  // List<Polygon> allPolygon = [];
  List<Marker> allMarkers = [
    // Marker(
    //   markerId: MarkerId("init"),
    //   // position: LatLng(10.84561, 106.809516),
    //   position: LatLng(currentTap.latitude, currentTap.longitude),
    //   icon: BitmapDescriptor.defaultMarker,
    // ),
  ];
  int _radioValue = 0;
  List<String> streetSegmentPathList = new List<String>();
  List<LatLng> path = new List<LatLng>();
  Account userAccount;
  // Default value AtStore
  bool onTapDelivery = false;
  bool existedZone = false;
  bool onFocus = false;
  bool onTapField = false;

  //InitState
  @override
  void initState() {
    super.initState();
    this.onTapDelivery = false;
    this.existedZone = false;
    this._getCurrentLocation();
    this.userAccount = this.widget.userAccountData;
    // getStreetSegment(context, '');
    this._getCurrentLocation();
  }

  // Get present position of user
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        this._userCurrentPosition = position;
        allMarkers.add(
          Marker(
            markerId: MarkerId("initHome"),
            position: LatLng(position.latitude, position.longitude),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
        print('User position: $_userCurrentPosition');

        // For moving the camera to current location
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 17.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  //Call API Zones Searching
  getMarker(LatLng tappedPoint, BuildContext context, String address,
      int searchBy) async {
    ZonesRequest request = new ZonesRequest(0, 0, "", 0, "",
        tappedPoint.latitude, tappedPoint.longitude, address, searchBy);
    // GeneralHelper.showDialogLoading(context);
    final overlay = LoadingOverlay.of(context);
    await overlay.during(searchZone(context, request).then(
      (res) {
        if (res.data.data != null) {
          setState(() {
            this.allMarkers = [
              Marker(
                markerId: MarkerId("currentTap"),
                position: currentTap,
              ),
            ];
          });
          this.onFocus = false;
          this.existedZone = true;
          getField(context, res.data.data);
        } else {
          this.existedZone = false;
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('Nothing here'),
              duration: Duration(seconds: 1),
            ),
          );
          setState(() {
            this.zones = [];
            this.storesList = [];
            this.fieldsList = [];
            this.streetSegmentPathList = [];
            this.allMarkers = [
              Marker(
                markerId: MarkerId("init"),
                position: currentTap,
              ),
            ];
          });
        }
      },
    ));
  }

  getStreetSegment(BuildContext context, String zoneId) {
    StreetSegmentsRequest request =
        new StreetSegmentsRequest(0, 0, "", 0, "", zoneId);
    searchStreetSegment(context, request).then((res) {
      if (res.data.data != null) {
        this.streetSegments = res.data.data;
        // setState(() {
        //   streetSegments = streetSegmentData;
        // });
        print(res.data.data);
      }
    });
  }

  //Add all Latitude and Longitude from Zones Searching Api to pointss list (helper for getLatlng function)
  // void _addPoints(LatLng strLocation, endLocation) {

  //   if (!pointss.contains(strLocation)) {
  //     pointss.add(strLocation);
  //   }
  //   if (!pointss.contains(endLocation)) {
  //     pointss.add(endLocation);
  //   }
  // }

  // void _addPoints() {
  //   //this.streetSegmentList.forEach((streetSegment) {});
  //   int count = 0;
  //   while (count < this.streetSegmentList.length) {
  //     if (count == 0) {
  //       this.pointss.add(new LatLng(this.streetSegmentList[0].strPoint.latitude,
  //           this.streetSegmentList[0].strPoint.longitude));
  //       this.pointss.add(new LatLng(this.streetSegmentList[0].endPoint.latitude,
  //           this.streetSegmentList[0].endPoint.longitude));
  //     } else {
  //       Point pointTmp = this
  //           .streetSegmentList
  //           .firstWhere((element) =>
  //               this.pointss[this.pointss.length - 1].latitude ==
  //                   element.strPoint.latitude &&
  //               double.parse(this
  //                       .pointss[this.pointss.length - 1]
  //                       .longitude
  //                       .toStringAsFixed(7)) ==
  //                   element.strPoint.longitude)
  //           .endPoint;

  //       if (!pointss
  //           .contains(new LatLng(pointTmp.latitude, pointTmp.longitude))) {
  //         this.pointss.add(new LatLng(pointTmp.latitude, pointTmp.longitude));
  //       }
  //     }

  //     ++count;
  //   }
  void _addPoints() {
    //this.streetSegmentList.forEach((streetSegment) {});
    int count = 0;
    while (count < this.streetSegmentPathList.length) {
      if (count == 0) {
        List<String> latLongStrs = streetSegmentPathList[0].split("|");
        latLongStrs.forEach((element) {
          List<String> latLongs = element.split(";");
          this.pointss.add(
              new LatLng(double.parse(latLongs[0]), double.parse(latLongs[1])));
        });

        // this.pointss.add(new LatLng(this.streetSegmentList[0].strPoint.latitude,
        //     this.streetSegmentList[0].strPoint.longitude));
        // this.pointss.add(new LatLng(this.streetSegmentList[0].endPoint.latitude,
        //     this.streetSegmentList[0].endPoint.longitude));
      } else {
        streetSegmentPathList.forEach((element) {
          List<String> latLongStrs = element.split("|");
          if (latLongStrs[0].toString() ==
              (this
                      .pointss[this.pointss.length - 1]
                      .latitude
                      .toStringAsFixed(6) +
                  ';' +
                  this
                      .pointss[this.pointss.length - 1]
                      .longitude
                      .toStringAsFixed(6))) {
            latLongStrs.forEach((e) {
              List<String> latLongTmp = e.split(";");
              double lat = double.parse(latLongTmp[0]);
              double long = double.parse(latLongTmp[1]);
              if (!pointss.contains(new LatLng(lat, long))) {
                this.pointss.add(new LatLng(lat, long));
              }
            });
          }
        });
      }

      ++count;
    }
    // if (!pointss.contains(strLocation)) {
    //   pointss.add(strLocation);
    // }
    // if (!pointss.contains(endLocation)) {
    //   pointss.add(endLocation);
    // }
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentTap.latitude, currentTap.longitude),
          zoom: 17.0,
        ),
      ),
    );
  }

  //Call Every Location from Zone Searching to drawZone
  getLatlng(List<StreetSegmentZone> streetSegmentZones) {
    double strLatitude, strLongitude, endLatitude, endLongitude = 0.0;
    setState(() {
      this.allPolygon = [];
      this.pointss = [];
      this.streetSegmentPathList = [];
    });
    for (var i = 0; i < streetSegmentZones.length; i++) {
      // strLatitude =
      //     streetSegmentZones[i].streetSegment.pointStartDetails.latitude;

      // strLongitude =
      //     streetSegmentZones[i].streetSegment.pointStartDetails.longitude;

      // endLatitude =
      //     streetSegmentZones[i].streetSegment.pointEndDetails.latitude;

      // endLongitude =
      //     streetSegmentZones[i].streetSegment.pointEndDetails.longitude;
      // streetSegmentPath = streetSegmentZones[i].streetSegment.streetSegmentPath;
      streetSegmentPathList
          .add(streetSegmentZones[i].streetSegment.streetSegmentPath);

      // _addPoints(
      //     LatLng(strLatitude, strLongitude), LatLng(endLatitude, endLongitude));
      // allPolygon.add(
      //   Polygon(
      //     polygonId: PolygonId(strLatitude.toString()),
      //     strokeWidth: 1,
      //     points: [
      //       LatLng(strLatitude, strLongitude),
      //       LatLng(endLatitude, endLongitude)
      //     ],
      //     fillColor: Colors.amberAccent.withOpacity(0.5),
      //   ),
      // );
      // print(path);
      // streetSegmentList.add(
      //   new StreetSegment(
      //     new Point(strLatitude, strLongitude),
      //     new Point(endLatitude, endLongitude),
      //   ),
      // );
    }
    _addPoints();
    allPolygon.add(
      Polygon(
        polygonId: PolygonId(strLatitude.toString()),
        strokeWidth: 1,
        points: pointss,
        // points: path,
        fillColor: Colors.amberAccent.withOpacity(0.8),
      ),
    );
  }

  //Last Step for draw polylines on map (only zone on index 0)
  drawZone(List<Zone> zones) {
    // this.currentZone.id = zones[0].id;
    // for (var i = 0; i < zones.length; i++) {
    // print(zones[i].id);
    List<StreetSegmentZone> streetSegmentZones = zones[0].streetSegmentZones;
    getLatlng(streetSegmentZones);
    // }
  }

  //Tap to get LatLng on Map
  _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    this.onTapField = true;
    if (this.onTapDelivery == false) {
      setState(
        () {
          this.onFocus = true;
          currentTap = tappedPoint;
          allMarkers = [
            Marker(
              markerId: MarkerId(tappedPoint.toString()),
              draggable: true,
              onTap: () {},
              position: tappedPoint,
              onDragEnd: (dragEndPosition) {},
            ),
          ];
          zones = [];
          allPolygon = [];
          this.getMarker(tappedPoint, context, "", 0);
        },
      );
    } else {
      setState(
        () {
          this.onFocus = true;
          currentTap = tappedPoint;
          allMarkers = [
            Marker(
              markerId: MarkerId(tappedPoint.toString()),
              draggable: true,
              onTap: () {},
              position: tappedPoint,
              onDragEnd: (dragEndPosition) {},
            ),
          ];
          zones = [];
          allPolygon = [];
          this.getMarker(tappedPoint, context, "", 1);
        },
      );
    }
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentTap.latitude, currentTap.longitude),
          zoom: 17.0,
        ),
      ),
    );
  }

  // Show card Zones
  List<Widget> viewZones() {
    int index = 0;
    return zones.map((eachZone) {
      index++;
      return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenHeight(10.0)),
          child: Container(
            height: getProportionateScreenHeight(150),
            width: getProportionateScreenWidth(300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: (index - 1) % 2 == 0
                        ? Colors.amberAccent.withOpacity(0.8)
                        : Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: getProportionateScreenHeight(100),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            eachZone.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(25),
                            ),
                            child: Text(
                              eachZone.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            eachZone.streetSegmentZones[0].streetSegment.ward
                                    .name +
                                ',\t' +
                                eachZone.streetSegmentZones[0].streetSegment
                                    .ward.district.name +
                                ',\t' +
                                eachZone.streetSegmentZones[0].streetSegment
                                    .ward.district.province.name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: getProportionateScreenHeight(50),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  // Card Zone
  CarouselSlider cardZone() {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        onScrolled: (item) {
          int i = item.round();
          setState(() {
            allPolygon = [];
            this.currentZoneId = zones[i].id;
            getLatlng(zones[i].streetSegmentZones);
            this.isSearchZone = true;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
      items: this.viewZones(),
    );
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  changMapMode() {
    getJsonFile("assets/map.json").then((mapStyle) {
      _controller.setMapStyle(mapStyle);
    });
  }

  /* Code by huynhp  */

  // Convert a picture to byte data
  Future<Uint8List> getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  // get All Store of ZoneId by calling API searchStore
  getAllStoreBasedOnZone(BuildContext context, String currentZoneId) {
    StoreRequest request = new StoreRequest(0, 0, "", 0, "", currentZoneId, "");
    searchStore(context, request).then(
      (res) {
        if (res.data.data != null) {
          this.storesList = res.data.data;
          for (var i = 0; i < this.storesList.length; i++) {
            setState(() {
              _showLocationStore(
                  LatLng(this.storesList[i].latitude,
                      this.storesList[i].longitude),
                  this.storesList[i].brand.name,
                  this.storesList[i].id);
            });
          }
        } else {
          setState(() {
            this.storesList = [];
          });
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }

  //get Field by calling API searchField
  getField(BuildContext context, List<Zone> zonesData) {
    SearchRequest request = new SearchRequest(0, 0, "", 0, "");
    searchField(context, request).then((res) {
      if (res.data.data != null) {
        this.fieldsList = res.data.data;
        // At Store
        if (this.onTapDelivery == false) {
          setState(() {
            zones = zonesData;
            this.currentZoneId = zones[0].id;
            drawZone(zones);
            getAllStoreBasedOnZone(context, this.currentZoneId);
            this.isSearchZone = true;
          });
        }
        // Delivery
        else {
          setState(
            () {
              zones = zonesData;
              this.storesList = [];
              drawZone(zones);
              for (var i = 0; i < this.zones.length; i++) {
                if (this.zones[i].storeZones.isNotEmpty) {
                  List<StoreZones> storeZones = zones[i].storeZones;
                  this.storesList.addAll(
                    [
                      storeZones[0].store,
                    ],
                  );
                }
              }
              this.currentZoneId = this.zones[0].id;
              this.isSearchZone = true;
              _showLocationStore(
                  LatLng(this.storesList[0].latitude,
                      this.storesList[0].longitude),
                  this.storesList[0].name,
                  this.storesList[0].id);
            },
          );
        }
      }
    });
  }

  // get Store of ZoneId and Field by calling API searchStore
  getStoreByZoneIdAndFieldId(
      BuildContext context, String currentZoneId, String chosenFieldId) {
    print(currentZoneId);
    StoreRequest request =
        new StoreRequest(0, 0, "", 0, "", currentZoneId, chosenFieldId);
    searchStore(context, request).then(
      (res) {
        if (res.data.data != null) {
          this.storesList = res.data.data;
          for (var i = 0; i < this.storesList.length; i++) {
            setState(() {
              allMarkers = [
                Marker(
                  markerId: MarkerId("init"),
                  position: currentTap,
                ),
              ];
              _showLocationStore(
                  LatLng(this.storesList[i].latitude,
                      this.storesList[i].longitude),
                  this.storesList[i].brand.name,
                  this.storesList[i].id);
            });
          }
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }

  // find Store by each ZoneId ( Delivery )
  findStoreByZoneId(String zoneId) {
    List<StoreZones> storeZones;
    dynamic storeByZone;
    for (var i = 0; i < this.zones.length; i++) {
      if (this.zones[i].id == zoneId) {
        storeZones = zones[i].storeZones;
        for (var i = 0; i < storeZones.length; i++) {
          storeByZone = storeZones[i].store;
        }
        for (var i = 0; i < this.storesList.length; i++) {
          if (this.storesList[i].id == storeByZone.id) {
            setState(() {
              allMarkers = [];
              _showLocationStore(
                  LatLng(this.storesList[i].latitude,
                      this.storesList[i].longitude),
                  this.storesList[i].name,
                  this.storesList[i].id);
            });
          }
        }
      }
    }
  }

  // Show the location Store
  Future<void> _showLocationStore(
      LatLng locationStore, String brandStore, String storeId) async {
    String brandUrl = '';
    String brandName = '';
    if (brandStore.contains('Passio')) {
      brandUrl = "assets/passioMarkerDesign.png";
      brandName = 'Passio';
    } else if (brandStore.contains('7-Eleven')) {
      brandUrl = "assets/7ElevenMarkerDesign.png";
      brandName = '7-Eleven';
    } else if (brandStore.contains('Mac Donal')) {
      brandUrl = "assets/donalMarkerDesign.png";
      brandName = 'Mac Donal';
    } else if (brandStore.contains('TPBank')) {
      brandUrl = "assets/tpBankMarkerDesign.png";
      brandName = 'TPBank Live';
    } else if (brandStore.contains('Starbucks')) {
      brandUrl = "assets/starbucksMarkerDesign.png";
      brandName = 'Starbucks';
    }

    final Uint8List brandIcon = await getBytesFromAsset(brandUrl, 80, 100);
    if (this.storesList.isNotEmpty)
      setState(() {
        allMarkers.addAll(
          [
            Marker(
                markerId: MarkerId(locationStore.toString()),
                position: locationStore,
                icon: BitmapDescriptor.fromBytes(brandIcon),
                onTap: () {
                  GeneralHelper.navigateToScreen(
                      context,
                      new DetailScreen(
                        storeId: storeId,
                      ),
                      false);
                }),
          ],
        );
      });
  }

  // Cut length if it is so long
  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  // UI Each Store
  List<Widget> viewStores() {
    int index = 0;
    return storesList.map((eachStore) {
      index++;
      return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenHeight(10.0)),
          child: Container(
            height: getProportionateScreenHeight(150),
            width: getProportionateScreenWidth(300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color:
                        (index - 1) % 2 == 0 ? Colors.lightGreen : Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: getProportionateScreenHeight(100),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            eachStore.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child: Text(
                              threeDotText(eachStore.description, 121),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: getProportionateScreenHeight(50),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  // UI FieldButton
  Container fieldButton() {
    return Container(
      color: this.existedZone ? Colors.white : null,
      width: SizeConfig.screenWidth * 0.6,
      height: getProportionateScreenHeight(70),
      child: ListView.builder(
        itemCount: fieldsList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return new Container(
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenWidth(60),
            child: Column(
              children: [
                FlatButton(
                  height: getProportionateScreenHeight(50),
                  child: SvgPicture.network(
                    fieldsList[index].iconUrl,
                    fit: BoxFit.fill,
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(30),
                  ),
                  onPressed: () {
                    this.currentFieldId = fieldsList[index].id;
                    this.getStoreByZoneIdAndFieldId(
                        context, this.currentZoneId, fieldsList[index].id);
                  },
                ),
                Text(
                  fieldsList[index].name,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(8),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // On tap RadioButton
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          setState(() {
            this.onTapDelivery = false;
            this.allMarkers = [];
            this.allPolygon = [];
            this.fieldsList = [];
            this.storesList = [];
            this.onFocus = true;
            this.existedZone = false;
            this.isSearchZone = false;
          });
          break;
        case 1:
          setState(() {
            this.onTapDelivery = true;
            this.allMarkers = [];
            this.allPolygon = [];
            this.fieldsList = [];
            this.storesList = [];
            this.onFocus = true;
            this.existedZone = false;
            this.isSearchZone = false;
          });
          break;
      }
    });
  }

  // UI RadioButtonBar
  Container radioButtonBar() {
    return Container(
        width: SizeConfig.screenWidth * 0.6,
        height: getProportionateScreenHeight(35),
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            RadioButton(
              value: 0,
              description: 'At store',
              onChanged: this._handleRadioValueChange,
              groupValue: this._radioValue,
            ),
            RadioButton(
              value: 1,
              description: 'Delivery',
              onChanged: this._handleRadioValueChange,
              groupValue: this._radioValue,
            ),
          ],
        ));
  }

  // UI Card Store
  CarouselSlider cardStore() {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        onScrolled: (storeZone) {
          int i = storeZone.round();
          setState(() {
            // If on clicking Delivery Radio Button
            if (this.onTapDelivery == true) {
              this.allPolygon = [];
              this.currentZoneId = zones[i].id;
              findStoreByZoneId(this.currentZoneId);
              getLatlng(zones[i].streetSegmentZones);
              this.isSearchZone = true;
            }
          });
        },
        scrollDirection: Axis.horizontal,
      ),
      items: this.viewStores(),
    );
  }

  // UI Drawer
  Widget drawerView() {
    return Container(
      height: getProportionateScreenHeight(900),
      width: getProportionateScreenWidth(250),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(50),
            ),
            height: getProportionateScreenHeight(150),
            width: getProportionateScreenWidth(250),
            child: Material(
              color: Colors.white,
              child: InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  GeneralHelper.navigateToScreen(
                      context, new ProfileScreen(this.userAccount), false);
                },
                child: Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Image.network(
                        this.userAccount.photoUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(20),
                      ),
                      child: Text(
                        this.userAccount.displayName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.purple[300],
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
              onPressed: () {
                GeneralHelper.navigateToScreen(context, SplashScreen(), true);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          expand: false,
          builder: (_, controller) {
            return InformationScreen(
              zoneId: this.currentZoneId,
              fieldId: this.currentFieldId,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: this._scaffoldKey,
      drawer: this.drawerView(),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black,
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                    changMapMode();
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(10.841461, 106.810079),
                    zoom: 15.0,
                  ),
                  markers: Set.from(allMarkers),
                  polygons: Set.from(allPolygon),
                  onTap: _handleTap,
                ),
                Positioned(
                  top: getProportionateScreenHeight(50),
                  child: Container(
                    width: getProportionateScreenWidth(30),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _scaffoldKey.currentState.openDrawer();
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: getProportionateScreenHeight(50),
                  left: getProportionateScreenWidth(40),
                  right: getProportionateScreenWidth(40),
                  child: Container(
                    width: SizeConfig.screenWidth * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      readOnly: this.onTapField,
                      onTap: () {
                        setState(() {
                          this.onTapField = false;
                          if (this.onTapField == false) {
                            this.onFocus = true;
                          }
                        });
                      },
                      onSubmitted: (value) {
                        this.onFocus = false;
                        if (value == '') {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Empty content'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else {
                          getMarker(LatLng(0, 0), context, _inputValue, 0);
                        }

                        setState(() {
                          this.allPolygon = [];
                          this.zones = [];
                          this.storesList = [];
                          this.fieldsList = [];
                          this.existedZone = false;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _inputValue = value;
                        });
                      },
                      controller: _searchPlaceController,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search any place",
                        prefixIcon: FlatButton(
                          minWidth: 15,
                          onPressed: () {
                            if (this._searchPlaceController.text == '') {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Empty content'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              getMarker(LatLng(0, 0), context, _inputValue, 0);
                            }
                          },
                          child: Icon(Icons.search),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenWidth(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: getProportionateScreenHeight(110),
                  left: getProportionateScreenWidth(30),
                  right: getProportionateScreenWidth(30),
                  child: radioButtonBar(),
                ),
                Positioned(
                  top: getProportionateScreenHeight(150),
                  left: getProportionateScreenWidth(30),
                  right: getProportionateScreenWidth(30),
                  child: fieldButton(),
                ),
                onFocus
                    ? Positioned(child: Container())
                    : Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: this.onTapDelivery
                              ? this.cardStore()
                              : this.cardZone(),
                        ),
                      ),
                Positioned(
                  top: SizeConfig.screenHeight * 0.5,
                  right: 10,
                  child: IConBtnWithCounter(
                    svgSrc: CURRENTLOCATION,
                    press: () {
                      _getCurrentLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: this.isSearchZone,
            child: Positioned(
              bottom: 0,
              left: 120,
              right: 120,
              child: GestureDetector(
                onTap: () {
                  _showSheet();
                },
                child: Icon(Icons.drag_handle, size: 50, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
