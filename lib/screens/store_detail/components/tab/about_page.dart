import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/store_detail/components/card/about_card.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/models/utilities/utilities.dart';
import 'package:project_places_api_mobile/shared/shared_components/store_container.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AboutPage extends StatefulWidget {
  final String title;
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final int numberOfSeat;
  final double avgAmountOfGuest;
  final String openTime;
  final String closeTime;
  final List<Utilities> utilities;
  final List<Store> nearStores;

  const AboutPage(
      {Key key,
      this.title,
      this.storeName,
      this.address,
      this.phone,
      this.description,
      this.ratingNum,
      this.numberOfSeat,
      this.openTime,
      this.closeTime,
      this.utilities,
      this.nearStores,
      this.avgAmountOfGuest})
      : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<Widget> itemsData = [];

  

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
              Container(
                child: Text(
                  this.widget.storeName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Container(
                child: Row(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/beauty-salon.png",
                      width: 32,
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Expanded(
                      child: Text(
                        this.widget.address,
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.network(
                    //   "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/vietnam.png",
                    //   width: 27,
                    // ),
                    // Text("\tVietnam\t|\t", style: TextStyle(fontSize: 13)),
                    Row(
                      children: [
                        Image.network(
                          NUMOFSEAT,
                          width: 30,
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                            "\tNumber of seat:\t" +
                                this.widget.numberOfSeat.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        Text('Rating: ', style: TextStyle(fontSize: 15)),
                        SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: 5,
                            rating: this.widget.ratingNum,
                            size: 17.0,
                            isReadOnly: true,
                            filledIconData: Icons.star_rate_rounded,
                            halfFilledIconData: Icons.star_half_rounded,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            spacing: 0.0),
                        Text(" " + this.widget.ratingNum.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Avg Amount Of Guest: ',
                            style: TextStyle(fontSize: 15)),
                        Text(this.widget.avgAmountOfGuest.toStringAsFixed(1)),
                      ],
                    )
                  ],
                ),
              ),
              new AboutCard(
                description: this.widget.description,
                phone: this.widget.phone,
                openTime: this.widget.openTime,
                closeTime: this.widget.closeTime,
                utilities: this.widget.utilities,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              itemsData.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                  height: getProportionateScreenHeight(35),
                                  width: getProportionateScreenWidth(7),
                                  color: Colors.blue),
                              SizedBox(width: getProportionateScreenWidth(10)),
                              Text(
                                "Recent locations",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          color: Colors.white,
                          height: SizeConfig.screenHeight * 0.4 - 40,
                          width: SizeConfig.screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: itemsData == null ? 0 : itemsData.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return itemsData[index];
                            },
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
