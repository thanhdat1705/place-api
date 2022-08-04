import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/widgets/popup/error_popup.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GeneralHelper {
  static ProgressDialog showDialogLoading(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Wating a second...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.blue, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.blue, fontSize: 19.0, fontWeight: FontWeight.w600));
    return pr;
  }

  static delayTimeAndCallback(int seconds, void Function() callback) async {
    var duration = new Duration(seconds: seconds);
    return new Timer(duration, callback);
  }

  static navigateToScreen(
      BuildContext context, Widget screen, bool removedCurrentScreen) async {
    if (removedCurrentScreen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static saveToSharedPreferences(String key, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (data is String) {
      prefs.setString(key, data);
    } else if (data is int) {
      prefs.setInt(key, data);
    } else if (data is double) {
      prefs.setDouble(key, data);
    } else if (data is bool) {
      prefs.setBool(key, data);
    } else if (data is List<String>) {
      prefs.setStringList(key, data);
    }
  }

  static dynamic getValueSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static errorDialog(context, statusCode) => showDialog(
      context: context,
      builder: (context) => ErrorPopup(statusCode: statusCode));
}
