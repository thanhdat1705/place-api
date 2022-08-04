import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/information/components/information_body.dart';
import 'package:project_places_api_mobile/shared/models/store/store.dart';

class InformationScreen extends StatefulWidget {
  final String zoneId;
  final String fieldId;

  InformationScreen({Key key, this.zoneId, this.fieldId,}) : super(key: key);

  @override
  InformationScreenState createState() => new InformationScreenState();
}

class InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    // return BrandStoreTab(storesList: this.widget.storesList,);
    return InformationBody(zoneId: this.widget.zoneId, fieldId: this.widget.fieldId,);
  }
}
