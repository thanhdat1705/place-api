import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_places_api_mobile/shared/models/utilities/utilities.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class AboutCard extends StatefulWidget {
  final String phone;
  final String description;
  final String openTime;
  final String closeTime;
  final List<Utilities> utilities;
  const AboutCard({
    Key key,
    this.phone,
    this.description,
    this.openTime,
    this.closeTime,
    this.utilities,
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 14),
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  size: 26,
                ),
                SizedBox(width: getProportionateScreenWidth(12)),
                RichText(
                  textAlign: TextAlign.end,
                  maxLines: 10,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Open:\t",
                        style: TextStyle(fontSize: 13, color: Colors.green),
                      ),
                      TextSpan(
                        text: this.widget.openTime.substring(0, 5) +
                            " - " +
                            this.widget.closeTime.substring(0, 5),
                        style: TextStyle(fontSize: 13, color: blackText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: getProportionateScreenWidth(15)),
                Text(
                  this.widget.phone,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              children: [
                Text(
                  "Utilities:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: getProportionateScreenWidth(24)),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    height: getProportionateScreenHeight(100),
                    width: SizeConfig.screenWidth,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: this.widget.utilities == null? 0: this.widget.utilities.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            height: getProportionateScreenHeight(40),
                            width: getProportionateScreenWidth(100),
                            margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                            // color: Colors.red,
                            // margin: EdgeInsets.only(
                            //   bottom: getProportionateScreenHeight(20),
                            //   left: getProportionateScreenWidth(20),
                            //   right: getProportionateScreenWidth(20),
                            // ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 45,
                                    child: SvgPicture.network(
                                      this.widget.utilities[index].iconUrl,
                                      // width: 90,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(10)),
                                Text(this.widget.utilities[index].name),
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
          SizedBox(height: getProportionateScreenHeight(10)),
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
