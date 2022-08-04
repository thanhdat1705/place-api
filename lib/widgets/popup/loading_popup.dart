import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoadingPopup extends StatefulWidget {
  final String message;
  final double percentage;

  const LoadingPopup({
    Key key,
    this.message,
    this.percentage,
  }) : super(key: key);
  @override
  _LoadingPopupState createState() => _LoadingPopupState();
}

class _LoadingPopupState extends State<LoadingPopup> {
  ProgressDialog proDialog;

  @override
  Widget build(BuildContext context) {
    proDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    // String message;
    // double percentage;
    // @override
    // void initState() {
    //   super.initState();
    //   message = widget.message;
    //   percentage = widget.percentage;
    // }
    var percentage = 0.0;
    return Container(
      child: RaisedButton(
        child: Text('Show Dialog'),
        onPressed: () {
          proDialog.show();
          Future.delayed(Duration(seconds: 3)).then((value) {
            percentage = percentage + 40.0;
            proDialog.update(
                progress: widget.percentage, message: widget.message);
          });
        },
      ),
    );
  }
}
