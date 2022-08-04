import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatefulWidget {
  String imageURL;
  String name;
  String date;
  double star;

  RatingCard({
    Key key,
    this.imageURL,
    this.name,
    this.date,
    this.star,
  }) : super(key: key);
  @override
  _RatingCardState createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: size.height * 0.1,
      width: size.width * 0.8,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
              widget.imageURL),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RatingBar(
                  initialRating: widget.star,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemSize: 15,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  textDirection: TextDirection.ltr,
                  onRatingUpdate: (rating) {
                    Text('rating');
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Text(widget.date),
        ],
      ),
    );
  }
}
