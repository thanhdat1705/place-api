import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/presenter/brand_store_tab_view_presenter.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/view%20model/brand_store_tab_viewmodel.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/view/brand_store_tab_view.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/brands/brands.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';
import 'package:project_places_api_mobile/shared/shared_components/store_container.dart';

class BrandStoreTab extends StatefulWidget {
  final String zoneId;
  final String fieldId;

  BrandStoreTab({Key key, this.zoneId, this.fieldId}) : super(key: key);

  @override
  _BrandStoreTabState createState() => _BrandStoreTabState();
}

class _BrandStoreTabState
    extends StateView<BrandStoreTab, IBrandStoreTabPresenter>
    implements IBrandStoreTabView {
  List<Brand> brands = new List<Brand>();
  void getStoreBrand() {
    if (this.presenter.getStoreList() != null) {
      this.presenter.getStoreList().forEach((store) {
        if (this.brands.any((brand) => brand.id == store.brandId)) {
          this
              .brands
              .firstWhere((brand) => brand.id == store.brandId)
              .stores
              .add(store);
        } else {
          Brand brandTmp = store.brand;
          brandTmp.stores = new List();
          brandTmp.stores.add(store);
          this.brands.add(brandTmp);
        }
      });
    }
  }

  @override
  void initState() {
    //  _CategoriesScrollerState().getListStores();
    super.initState();
    print(this.presenter.getStoreList().toString());
    // this.getStoreBrand();
    this.presenter.brandStoreTabView = this;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.5 - 50;
    this.getStoreBrand();
    if (this.presenter.getStoreList().length == 0) {
      return new Scaffold(
        body: Center(
          child: SizedBox(
            height: 90,
            width: 90,
            child: new CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   title: Text(
        //     "Brands",
        //     style: TextStyle(
        //       fontSize: 40,
        //       color: Colors.grey[700],
        //       fontFamily: 'PlayBall',
        //     ),
        //   ),
        //   leading: new IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     color: Colors.black,
        //     onPressed: () {
        //       Navigator.pop(context, true);
        //     },
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.autorenew),
        //       color: Colors.black,
        //       onPressed: () {
        //         print("reload");
        //         GeneralHelper.navigateToScreen(context, BrandStoreTab(storesList: this.widget.storesList), true);
        //       },
        //     )
        //   ],
        // ),
        body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: this.brands == null ? 0 : this.brands.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: categoryHeight,
                color: Colors.white,
                child: CategoriesScroller(
                  category: this.brands[index].name,
                  stores: this.brands[index].stores,
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  IBrandStoreTabPresenter createPresenter() {
    return new BrandStoreTabPresenter(context, this.widget.zoneId, this.widget.fieldId);
  }

  @override
  void refreshBrandStoreTabService(BrandStoreTabViewModel viewModel) {
    setState(() {
      this.presenter.brandStoreTabViewModel = viewModel;
    });
  }
}

class CategoriesScroller extends StatefulWidget {
  final String category;
  final List<Store> stores;
  CategoriesScroller({this.category, this.stores});

  @override
  _CategoriesScrollerState createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  List<Widget> itemsData = [];

  @override
  void initState() {
    getListStores();
    super.initState();
  }

  void getListStores() {
    List<Widget> listStoresData = [];
    this.widget.stores.forEach((cardStore) {
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
    final double cardHeight = MediaQuery.of(context).size.height * 0.5 - 120;
    final double padding = MediaQuery.of(context).size.width * 0.5;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 7,
                  height: 35,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.purpleAccent),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                ),
                Text(
                  widget.category,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: padding / 11, vertical: 10),
            color: Colors.white,
            height: cardHeight,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemsData == null ? 0 : itemsData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return itemsData[index];
              },
            ),
          ),

          // StoreContainer(
          //   height: categoryHeight,
          //   name: "Um Ba La Xi Bua",
          //   item: "20",
          //   color: Colors.grey[50],
          //   imageURL:
          //       "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_SWD/Test/tra.jpg",
          // ),
          // StoreContainer(
          //   height: categoryHeight,
          //   name: "Newest Newest Newest",
          //   item: "20",
          //   color: Colors.grey[50],
          //   imageURL:
          //       "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_SWD/Test/tra_sua.jpg",
          // ),
          // StoreContainer(
          //   height: categoryHeight,
          //   name: "Superman Comeback",
          //   item: "20",
          //   color: Colors.grey[50],
          //   imageURL:
          //       "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_SWD/Test/brand_circle_avatar.png",
          // ),
        ],
      ),
    );
  }
}
