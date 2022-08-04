import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_places_api_mobile/shared/models/street_segment_status/street_segment_status.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class AboutCard extends StatefulWidget {
  final String phone;
  final String description;
  final String openTime;
  final String closeTime;
  final List<StreetSegmentStatus> streetSegmentStatuses;
  const AboutCard({
    Key key,
    this.phone,
    this.description,
    this.openTime,
    this.closeTime,
    this.streetSegmentStatuses,
  }) : super(key: key);
  @override
  _AboutCardState createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool _isVisible = false;
  String tap = "See more";

  void showToast() {
    if (tap == "See less") {
      tap = "See more";
    } else {
      tap = "See less";
    }
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Colors.grey, width: 0.2),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 3,
        //     blurRadius: 5,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information",
            style: TextStyle(fontSize: getProportionateScreenHeight(20), fontWeight: FontWeight.bold),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.description_outlined),
                SizedBox(width: getProportionateScreenWidth(15)),
                Expanded(
                  child: AutoSizeText(
                    this.widget.description,
                    style: TextStyle(fontSize: getProportionateScreenHeight(16)),
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  size: 26,
                ),
                SizedBox(width: getProportionateScreenWidth(12)),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    height: getProportionateScreenHeight(200),
                    width: SizeConfig.screenWidth,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: this.widget.streetSegmentStatuses == null
                            ? 0
                            : this.widget.streetSegmentStatuses.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    this
                                        .widget
                                        .streetSegmentStatuses[index]
                                        .timeStart
                                        .substring(0, 5),
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(16),
                                        color: blackText)),
                                Text(" - ",
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(16),
                                    )),
                                Text(
                                    this
                                        .widget
                                        .streetSegmentStatuses[index]
                                        .timeEnd
                                        .substring(0, 5),
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(16),
                                        color: blackText)),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                Container(
                                  width: getProportionateScreenWidth(170),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getProportionateScreenWidth(130),
                                        child: Text(
                                            this
                                                .widget
                                                .streetSegmentStatuses[index]
                                                .trafficDensity
                                                .type,
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(16),
                                                color: blackText)),
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        width: getProportionateScreenWidth(170),
                                        child: Text(
                                          "Avg Vehicle Speed: " +
                                            this
                                                .widget
                                                .streetSegmentStatuses[index]
                                                .avgVehicleSpeed.toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(16),
                                                color: blackText)),
                                      ),
                                      Container(
                                        width: getProportionateScreenWidth(170),
                                        child: Text(
                                          "Number of lanes: " +
                                            this
                                                .widget
                                                .streetSegmentStatuses[index]
                                                .numberOfLanes.toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(16),
                                                color: blackText)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(
                                      left: getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                      // color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: SvgPicture.network(
                                    this
                                        .widget
                                        .streetSegmentStatuses[index]
                                        .trafficDensity
                                        .iconUrl,
                                    // width: 0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Image.network(
                //   "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/cashier.png",
                //   width: 40,
                // ),
              ],
            ),
          ),
          // SizedBox(height: getProportionateScreenHeight(10)),
          // Visibility(
          //   visible: _isVisible,
          //   child: Column(
          //     children: [
          //       Container(
          //         color: Colors.white,
          //         margin:
          //             EdgeInsets.only(left: getProportionateScreenWidth(85)),
          //         child: Row(
          //           children: [
          //             // SizedBox(
          //             //     width: getProportionateScreenHeight(1)),
          //             Image.network(
          //               "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/free-parking.png",
          //               width: 40,
          //             ),
          //             SizedBox(width: getProportionateScreenWidth(40)),
          //             Image.network(
          //               "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/invoice.png",
          //               width: 40,
          //             ),
          //             SizedBox(width: getProportionateScreenWidth(40)),
          //             Image.network(
          //               "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/male-and-female.png",
          //               width: 40,
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: getProportionateScreenHeight(20)),
          //       Container(
          //         color: Colors.white,
          //         margin:
          //             EdgeInsets.only(left: getProportionateScreenWidth(85)),
          //         child: Row(
          //           children: [
          //             Image.network(
          //               "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/water-bottle.png",
          //               width: 40,
          //             ),
          //             SizedBox(width: getProportionateScreenWidth(40)),
          //             Image.network(
          //               "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/wifi.png",
          //               width: 40,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: getProportionateScreenHeight(10)),
          // GestureDetector(
          //   onTap: () {
          //     showToast();
          //   },
          //   child: Container(
          //       color: Colors.white,
          //       margin: EdgeInsets.fromLTRB(88, 0.0, 0.0, 0),
          //       child: Text(
          //         tap,
          //         style: TextStyle(
          //             fontSize: 13,
          //             color: Colors.blueAccent,
          //             fontWeight: FontWeight.w500),
          //       )),
          // ),


        ],
      ),
    );
  }
}
