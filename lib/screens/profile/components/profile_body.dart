import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_places_api_mobile/screens/home/home_screen.dart';
import 'package:project_places_api_mobile/screens/profile/presenter/profile_presenter.dart';
import 'package:project_places_api_mobile/screens/updated_profile/updated_profile_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/brands/brands.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class ProfileBody extends StatefulWidget {
  final ProfilePresenter presenter;
  ProfileBody(this.presenter, {Key key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Account accountProfile;
  // Brand brand;
  DateTime time = DateTime.now();
  List<Brand> brandsStore = new List<Brand>();
  String _textView = '';
  String displayName;
  String _descriptionUser;
  bool _longLengthUsername = false;
  double sizeEmail;
  final DateFormat vnTimeFormat = DateFormat('dd-MM-yyyy');
  void _ascendingDate(String date) {}
  @override
  void initState() {
    super.initState();

    // var dateTimeTest = DateFormat('dd-MM-yyyy').parse('16-10-2020');
    // var dateTimeTest1 = DateFormat('dd-MM-yyyy').parse('26-10-2020');
    this.accountProfile = this.widget.presenter.profileViewModel.userAccount;
    if (this.accountProfile.displayName.trim().length > 23) {
      this._longLengthUsername = true;
    }

    if (this.accountProfile.email.trim().length > 25) {
      this.sizeEmail = getProportionateScreenWidth(14.5);
    } else if (this.accountProfile.email.trim().length > 22 &&
        this.accountProfile.email.trim().length <= 25) {
      this.sizeEmail = getProportionateScreenWidth(15);
    } else {
      this.sizeEmail = getProportionateScreenWidth(17);
    }
    // bool check = dateTimeTest.isAfter(dateTimeTest1);
    // print('compareTime: ' + check.toString());

    if (this.accountProfile.description != null) {
      this._descriptionUser = this.accountProfile.description;
    } else {
      this._descriptionUser = '';
    }

    // for (int i = 0; i < brandStore.length; i++) {
    //   map.addAll(brandStore[i].name);
    // }
    // print('DateTimeVN: ' + dateTimeTestFormat.toString());
    // print('DateTimeVN1: ' + dateTimeTest1Format.toString());
    // print('DateTimeVN2: ' + dateTimeTest2Format.toString());
    // print('DateTimeVN3: ' + dateTimeTest3Format.toString());
    // Brand phucLong = new Brand(
    //     'Phuc Long', 'Delicious tea, good place to get a fun with friends');
    // Brand starbucks = new Brand(
    //     'Starbucks', 'Nice coffee, expensive and quite place to get a work');
    // Brand trungNguyen = new Brand(
    //     'Trung Nguyen', 'Nice coffee, and place to enjoy Vietnamese coffee');
    // Brand tooCha = new Brand('Toocha', 'Good milk tea and price');
    // brandsStore.add(phucLong);
    // brandsStore.add(starbucks);
    // brandsStore.add(tooCha);
    // brandsStore.add(trungNguyen);
    // if (this.brandsStore.length > 3) {
    //   this._textView = 'View more';
    // } else {
    //   this._textView = '';
    // }
  }

  // @override
  // IProfilePresenter createPresenter() {
  //   return new ProfilePresenter();
  // }

  // @override
  // void refreshProfile(ProfileViewModel viewModel) {
  //   setState(() {
  //     this._profileViewModel = viewModel;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            iconSize: getProportionateScreenWidth(30),
            onPressed: () {
              GeneralHelper.navigateToScreen(
                  context, new HomeScreen(this.accountProfile), true);
            },
          ),
          centerTitle: true,
          title: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Playball',
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(24),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(
              //     top: getProportionateScreenHeight(30),
              //     bottom: getProportionateScreenHeight(15),
              //   ),
              //   child: Text(
              //     "My Profile",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: getProportionateScreenWidth(24),
              //       fontWeight: FontWeight.w900,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Material(
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    GeneralHelper.navigateToScreen(
                        context, UpdatedProfileScreen(), false);
                    // this
                    //     .widget
                    //     .presenter
                    //     .navigateToUpdateProfile(context, this.accountProfile);
                  },
                  child: Container(
                    height: getProportionateScreenHeight(120),
                    width: getProportionateScreenWidth(330),
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      this.accountProfile.photoUrl),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(8),
                                    getProportionateScreenHeight(5),
                                    0,
                                    0),
                                child: Container(
                                  height: this._longLengthUsername
                                      ? getProportionateScreenHeight(50)
                                      : getProportionateScreenHeight(25),
                                  width: getProportionateScreenWidth(220),
                                  child: AutoSizeText(
                                    this.accountProfile.displayName,
                                    minFontSize:
                                        getProportionateScreenWidth(17),
                                    stepGranularity:
                                        getProportionateScreenWidth(17),
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(15),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(8)),
                                child: Text(
                                  'Customer',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: getProportionateScreenWidth(13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(8)),
                                child: Container(
                                  height: getProportionateScreenHeight(40),
                                  width: getProportionateScreenWidth(220),
                                  child: AutoSizeText(
                                    this.accountProfile.email,
                                    minFontSize: this.sizeEmail,
                                    stepGranularity: this.sizeEmail,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(25),
                  getProportionateScreenHeight(28),
                  getProportionateScreenWidth(25),
                  getProportionateScreenHeight(28),
                ),
                child: Container(
                  height: getProportionateScreenHeight(80),
                  alignment: Alignment.topLeft,
                  child: Text(
                    this._descriptionUser,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: getProportionateScreenWidth(330),
              //   margin: EdgeInsets.only(
              //     bottom: getProportionateScreenHeight(10),
              //   ),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         'Your Activities',
              //         style: TextStyle(
              //           fontSize: getProportionateScreenWidth(15),
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(
              //         width: getProportionateScreenWidth(150),
              //       ),
              //       Container(
              //         child: InkWell(
              //           onTap: () {},
              //           child: Text(
              //             this._textView,
              //             style: TextStyle(
              //               fontSize: getProportionateScreenWidth(14),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   child: Expanded(
              //     child: ListView.builder(
              //       physics: BouncingScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       shrinkWrap: true,
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.fromLTRB(
              //               getProportionateScreenWidth(20),
              //               0,
              //               getProportionateScreenWidth(20),
              //               0),
              //           child: Container(
              //             child: Column(
              //               children: <Widget>[
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                       bottom: getProportionateScreenHeight(30)),
              //                   child: InkWell(
              //                     onTap: () {},
              //                     child: Container(
              //                       height: getProportionateScreenHeight(120),
              //                       width: size.width,
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.all(
              //                           Radius.circular(20),
              //                         ),
              //                         boxShadow: [
              //                           BoxShadow(
              //                             color: Colors.grey.withOpacity(0.5),
              //                             spreadRadius: 1,
              //                             blurRadius: 2,
              //                             offset: Offset(0, 3),
              //                           ),
              //                         ],
              //                       ),
              //                       child: Row(
              //                         children: <Widget>[
              //                           Container(
              //                             child: ClipRRect(
              //                               borderRadius: BorderRadius.only(
              //                                 bottomLeft: Radius.circular(20),
              //                                 topLeft: Radius.circular(20),
              //                               ),
              //                               child: Container(
              //                                 width: MediaQuery.of(context)
              //                                         .size
              //                                         .width /
              //                                     4,
              //                                 height: MediaQuery.of(context)
              //                                         .size
              //                                         .width /
              //                                     3,
              //                                 decoration: BoxDecoration(
              //                                   image: DecorationImage(
              //                                     fit: BoxFit.fill,
              //                                     image: NetworkImage(this
              //                                         .accountProfile
              //                                         .photoUrl),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                           Container(
              //                             width:
              //                                 getProportionateScreenWidth(230),
              //                             padding: EdgeInsets.fromLTRB(
              //                                 getProportionateScreenWidth(18),
              //                                 getProportionateScreenHeight(5),
              //                                 0,
              //                                 0),
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: <Widget>[
              //                                 Text(
              //                                   '',
              //                                   style: TextStyle(
              //                                     fontSize:
              //                                         getProportionateScreenWidth(
              //                                             14),
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                     height:
              //                                         getProportionateScreenHeight(
              //                                             10)),
              //                                 Container(
              //                                   height:
              //                                       getProportionateScreenHeight(
              //                                           50),
              //                                   width:
              //                                       getProportionateScreenWidth(
              //                                           220),
              //                                   child: Text(
              //                                     '',
              //                                     style: TextStyle(
              //                                         fontSize:
              //                                             getProportionateScreenWidth(
              //                                                 12),
              //                                         color: Colors.grey),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                     height:
              //                                         getProportionateScreenHeight(
              //                                             10)),
              //                                 Text(
              //                                   "" +
              //                                       DateFormat.yMMMEd()
              //                                           .format(time),
              //                                   style: TextStyle(
              //                                     fontSize:
              //                                         getProportionateScreenWidth(
              //                                             15),
              //                                     color: Colors.green,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
