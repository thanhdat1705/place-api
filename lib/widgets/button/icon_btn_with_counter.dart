import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class IConBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;
  const IConBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfItems = 0,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              // color: kSecondaryColor.withOpacity(0.2),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.network(svgSrc),
          ),
          if (numOfItems != 0)
            Positioned(
              top: -4,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
