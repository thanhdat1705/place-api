import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_places_api_mobile/data/list_activity_time_store.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:intl/intl.dart';

class LocationPage extends StatefulWidget {
  final String address;
  final String openTime;
  final String closeTime;
  double latitude;
  double longitude;
  LocationPage(
      {Key key,
      this.address,
      this.openTime,
      this.closeTime,
      this.latitude,
      this.longitude})
      : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<Widget> itemsData = [];
  DateTime date = new DateTime.now();
  GoogleMapController _controller;
  LatLng position;
  List<Marker> allMarkers = [ 
    // Marker(
    //   markerId: MarkerId("init"),
    //   // position: LatLng(10.8418, 106.8092),
    //   // LatLng(10.84561, 106.809516),
    //   position: LatLng(1, 1),
    //   icon: BitmapDescriptor.defaultMarker,
    // ),
  ];

  @override
  void initState() {
    super.initState();
    checkIsToday();
    getActivityTime();
    

      position = LatLng(this.widget.latitude, this.widget.longitude);
      allMarkers.add(
        Marker(
      markerId: MarkerId("init"),
      // position: LatLng(10.8418, 106.8092),
      // LatLng(10.84561, 106.809516),
      position: LatLng(position.latitude, position.longitude),
      icon: BitmapDescriptor.defaultMarker,
    ),
      );

  }

  // _getCurrentLocation() async {
  //   await _geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) async {
  //     setState(() {
  //       // Store the position in the variable
  //       _userCurrentPosition = position;

  //       print('CURRENT POS: $_userCurrentPosition');

  //       // For moving the camera to current location
  //       _controller.animateCamera(
  //         CameraUpdate.newCameraPosition(
  //           CameraPosition(
  //             target: LatLng(position.latitude, position.longitude),
  //             zoom: 18.0,
  //           ),
  //         ),
  //       );
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

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
                        fontSize: getProportionateScreenHeight(17),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/icons8-location-100.png",
                        width: 45,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          this.widget.address,
                          style: TextStyle(fontSize: 15),
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
              height: size.height * 0.3,
              color: Colors.white,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  changMapMode();
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(this.widget.latitude, this.widget.longitude),
                  // target: LatLng(10.84561, 106.809516),
                  zoom: 15.0,
                ),
                markers: Set.from(allMarkers),
                // markers: true ? Set.from(allMarkers) : ,
                // polygons: Set.from(allPolygon),
                // onTap: _handleTap,
              ),
              // Image.network(
              //   "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/barber_map.jpg",
              //   fit: BoxFit.fill,
              // ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              margin: EdgeInsets.only(top: getProportionateScreenHeight(15)),
              child: Text(
                "Opening Hours\n",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: itemsData == null ? 0 : itemsData.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
