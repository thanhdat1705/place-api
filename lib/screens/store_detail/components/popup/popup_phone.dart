import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupPhone extends StatefulWidget {
  final String phoneNumber;

  const PopupPhone({Key key, this.phoneNumber}) : super(key: key);
  @override
  _PopupPhoneState createState() => _PopupPhoneState();
}

class _PopupPhoneState extends State<PopupPhone> {
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  // void customLaunch(command) async {
  //     if (await canLaunch(command)) {
  //       await launch(command);
  //     } else {
  //       print(' could not launch $command');
  //     }
  //   }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child:
                // RaisedButton(
                //       onPressed: () {
                //         // customLaunch('tel:+1 555 555 555');
                //       },
                //       child: Text('Phone'),
                //     ),
                FlatButton(
              onPressed: () => {
                launchUrl("tel:08906661654"),
                print('clicked call phone'),
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.green),
                  Text("Call",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  Spacer(),
                  Text("+08906661654",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
