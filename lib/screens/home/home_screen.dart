import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/home/components/home_map.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';

class HomeScreen extends StatefulWidget {
  // final List<Field> listField;
  // final List<Store> storesList;
  final Account userAccount;
  const HomeScreen(this.userAccount, {Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeMap(this.widget.userAccount);
    // return HomeMap();
  }
}
