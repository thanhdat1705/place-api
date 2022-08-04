import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_places_api_mobile/data/list_activity_time_store.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:intl/intl.dart';

class LocationStreet extends StatefulWidget {
  final String address;
  final String openTime;
  final String closeTime;
  final String ward;
  final String district;
  final String province;
  final String street;
  final String streetSegmentPath;
  double latitude;
  double longitude;
  // static GoogleMapOverlayController controller =
  //     GoogleMapOverlayController.fromSize(width: 300.0, height: 200.0);

  LocationStreet(
      {Key key,
      this.address,
      this.openTime,
      this.closeTime,
      this.latitude,
      this.longitude,
      this.ward,
      this.district,
      this.province,
      this.street,
      this.streetSegmentPath})
      : super(key: key);

  @override
  _LocationStreetState createState() => _LocationStreetState();
}

class _LocationStreetState extends State<LocationStreet> {
  List<Widget> itemsData = [];
  DateTime date = new DateTime.now();
  GoogleMapController _controller;
  List<NavigatorObserver> observers;
  LatLng position;
  List<Marker> allMarkers = [];
  List<Polygon> allPolygon = [];
  List<LatLng> points = List<LatLng>();
  List<String> streetSegmentPathList = new List<String>();
//------------------------------------
  void _addPoints() {
    int count = 0;
    while (count < this.streetSegmentPathList.length) {
      if (count == 0) {
        List<String> latLongStrs = streetSegmentPathList[0].split("|");
        latLongStrs.forEach((element) {
          List<String> latLongs = element.split(";");
          this.points.add(
              new LatLng(double.parse(latLongs[0]), double.parse(latLongs[1])));
        });
      } else {
        streetSegmentPathList.forEach((element) {
          List<String> latLongStrs = element.split("|");
          if (latLongStrs[0].toString() ==
              (this.points[this.points.length - 1].latitude.toStringAsFixed(6) +
                  ';' +
                  this
                      .points[this.points.length - 1]
                      .longitude
                      .toStringAsFixed(6))) {
            latLongStrs.forEach((e) {
              List<String> latLongTmp = e.split(";");
              double lat = double.parse(latLongTmp[0]);
              double long = double.parse(latLongTmp[1]);

              // if (!points.contains(new LatLng(lat, long))) {
              this.points.add(new LatLng(lat, long));
              // }
            });
          }
        });
      }
      ++count;
    }
    for (var i = 0; i < points.length - 1; i++) {
      print(points[i].toString() + " - " + points[i + 1].toString());

      allPolygon.add(
        Polygon(
          polygonId: PolygonId(2.toString()),
          strokeWidth: 4,
          points: [points[i], points[i + 1]],
          fillColor: Colors.amberAccent.withOpacity(0.5),
          strokeColor: Colors.blue,
        ),
      );
    }
    allMarkers.addAll([
      Marker(
        markerId: MarkerId("begin"),
        position: points[0],
      ),
      Marker(
        markerId: MarkerId("end"),
        position: points[points.length - 1],
      ),
    ]);
  }

//----------------------------------------
  @override
  void initState() {
    super.initState();
    checkIsToday();
    getActivityTime();
    streetSegmentPathList.add(this.widget.streetSegmentPath);
    _addPoints();

    position = LatLng(this.widget.latitude, this.widget.longitude);
    //  _controller = GoogleMapOverlayController.fromSize(width: 300.0, height: 200.0);
    //     observers = <NavigatorObserver>[];
    //     observers .add(_controller.overlayController);
  }

  changMapMode() {
    getJsonFile("assets/map.json").then((mapStyle) {
      _controller.setMapStyle(mapStyle);
    });
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void checkIsToday() {
    String today = DateFormat('EEEE').format(date);
    activityTime.forEach((element) {
      if (today.toLowerCase().contains(element['day'].toLowerCase())) {
        element['isToday'] = true;
      }
    });
  }

  void getActivityTime() {
    List<Widget> timeData = new List();
    bool _checkToday = false;
    activityTime.forEach((element) {
      _checkToday = element["isToday"];
      timeData.add(
        Row(
          children: [
            Text(
              element["day"],
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  color: _checkToday ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              this.widget.openTime.substring(0, 5) +
                  " - " +
                  this.widget.closeTime.substring(0, 5) +
                  "\n",
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  color: _checkToday ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
    setState(() {
      itemsData = timeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(context, itemsData),
      ],
    );
  }

  SliverFillRemaining _buildSliverContent(
      BuildContext context, List<Widget> itemsData) {
    Size size = MediaQuery.of(context).size;
    return SliverFillRemaining(
      child: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25), vertical: 8),
              height: size.height * 0.2 - 60,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Location',
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(25),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/icons8-location-100.png",
                        width: 50,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          this.widget.street +
                              ", " +
                              this.widget.ward +
                              ", " +
                              this.widget.district +
                              ", " +
                              this.widget.province,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16),
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              height: size.height * 0.5 - 10,
              color: Colors.white,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  changMapMode();
                },
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(this.points[0].latitude, this.points[0].longitude),
                  // target: LatLng(10.84561, 106.809516),
                  zoom: 15.0,
                ),
                markers: Set.from(allMarkers),
                // markers: true ? Set.from(allMarkers) : ,
                polygons: Set.from(allPolygon),
                // onTap: _handleTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
