import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:project_places_api_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_places_api_mobile/screens/store_detail/services/store_detail_service.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';

// ignore: must_be_immutable
class StoreContainer extends StatefulWidget {
  String name;
  String numberOfSeat;
  double height;
  Color color;
  String imageURL;
  String openTime;
  String closeTime;
  final String address;
  final String description;
  final String storeId;

  StoreContainer(
      {this.name,
      this.numberOfSeat,
      this.height,
      this.color,
      this.imageURL,
      this.openTime,
      this.closeTime,
      this.address,
      this.description,
      this.storeId});

  @override
  _StoreContainerState createState() => _StoreContainerState();
}

class _StoreContainerState extends State<StoreContainer> {
  DateTime time = DateTime.now();
  Color iconColor = Colors.white;
  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  @override
  void initState() {
    // checkStoreFollowing();
    super.initState();
  }

  // void checkStoreFollowing() {
  //   List<String> storeFollowing = MemoryStorage.get('FollowingStore');
  //   if (storeFollowing.any((following) => following == this.widget.storeId)) {
  //     iconColor = Colors.purpleAccent;
  //   }else {
  //     iconColor = Colors.white;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // initStoreDetailScreen(context, this.widget.storeId);
        GeneralHelper.navigateToScreen(
          context, new DetailScreen(storeId: this.widget.storeId,), false);
      },
      child: Container(
        width: size.width * 0.5 + 90,
        margin: EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 10),
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(2, 5),
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: getProportionateScreenHeight(170),
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(widget.imageURL),
                  fit: BoxFit.fill,
                ),
              ),
              // child: Stack(
              //   children: <Widget>[
              //     Positioned(
              //         top: 0,
              //         right: 0,
              //         child: IconButton(
              //           icon: Icon(Icons.favorite),
              //           color: this.iconColor,
              //           iconSize: 40,
              //           onPressed: () {
              //             // postFollowingStoreAPI(context, this.widget.storeId).then((value) {
              //             setState(() {
              //               if (this.iconColor == Colors.purpleAccent) {
              //                 this.iconColor = Colors.white;
              //               } else {
              //                 this.iconColor = Colors.purpleAccent;
              //               }
              //             });
              //             // });

              //             print("click Follow");
              //           },
              //         ))
              //   ],
              // ),
            ),
            // Spacer(),
            Container(
              // color: Colors.red,
              // height: MediaQuery.of(context).size.height * 0.10 - 40,
              padding: EdgeInsets.only(left: 10, top: 5),
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      threeDotText(widget.name, 20),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'roboto'),
                    ),
                    Text(
                      threeDotText(widget.description, 38),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontFamily: 'roboto'),
                    ),
                    Text(
                      'Address: ' + threeDotText(widget.address, 30),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'roboto'),
                    ),
                  ]),
            ),
            Spacer(),
            Container(
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  color: Colors.grey[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.event_seat,
                        color: Colors.grey[500],
                        size: 13,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.numberOfSeat + " | ",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.update,
                        color: Colors.grey[500],
                        size: 12,
                      ),
                      Text(
                        this.widget.openTime.substring(0, 5) +
                            " - " +
                            this.widget.closeTime.substring(0, 5),
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    color: Colors.grey[50],
                                    child: Text(
                                      "Share",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    onPressed: () {
                                      print("Share clicked");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    color: Colors.white,
                                    child: Text(
                                      "Detail",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    onPressed: () {
                                      initStoreDetailScreen(
                                          context, this.widget.storeId);
                                      print("Detail clicked");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    color: Colors.white,
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    onPressed: () {
                                      print("Cancel clicked");
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                  .animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                  // color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  minWidth: 50,
                  height: 30,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
