import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/brand_store_tab.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/street_tab.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:tuple/tuple.dart';

class InformationBody extends StatefulWidget {
  final String zoneId;
  final String fieldId;

  InformationBody({Key key, this.zoneId, this.fieldId}) : super(key: key);

  @override
  _InformationBodyState createState() => _InformationBodyState();
}

class _InformationBodyState extends State<InformationBody>
    with SingleTickerProviderStateMixin {
  List<Tuple3> tabList;
  TabController _tabController;

  // List<Brand> brands = new List<Brand>();
  // void getStoreBrand() {
  //   this.widget.storesList.forEach((store) {
  //     if (this.brands.any((brand) => brand.id == store.brandId)) {
  //       this
  //           .brands
  //           .firstWhere((brand) => brand.id == store.brandId)
  //           .stores
  //           .add(store);
  //     } else {
  //       Brand brandTmp = store.brand;
  //       brandTmp.stores = new List();
  //       brandTmp.stores.add(store);
  //       this.brands.add(brandTmp);
  //     }
  //   });
  // }

  @override
  void initState() {
    //  _CategoriesScrollerState().getListStores();
    super.initState();
    // print(this.widget.storesList.toString());
    // this.getStoreBrand();
    this.tabList = [
      Tuple3(
          'Brand',
          BrandStoreTab(zoneId: this.widget.zoneId, fieldId: this.widget.fieldId),
          Icon(Icons.store, size: getProportionateScreenHeight(25))),
      Tuple3('Street', StreetTab(zoneId: this.widget.zoneId),
          Icon(Icons.edit_road, size: getProportionateScreenHeight(25))),
    ];
    _tabController = TabController(length: this.tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: DefaultTabController(
        length: this.tabList.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Information",
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[700],
                fontFamily: 'PlayBall',
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.purple,
              labelPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenHeight(5)),
              indicatorColor: Colors.purple,
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
                                fontSize: getProportionateScreenHeight(20)),
                          ),
                        ],
                      )))
                  .toList(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children:
                this.tabList.map<Widget>((Tuple3 page) => page.item2).toList(),
          ),
        ),
      ),
    );
  }
}
