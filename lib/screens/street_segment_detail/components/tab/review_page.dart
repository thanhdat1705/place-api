import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_places_api_mobile/data/list_reviewer.dart';
import 'package:project_places_api_mobile/screens/store_detail/components/card/rating_card.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:fl_chart/fl_chart.dart';

class ReviewPage extends StatefulWidget {
  final String title;

  const ReviewPage({Key key, this.title}) : super(key: key);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<Widget> itemsData = [];

  @override
  void initState() {
    getListReviewer();
    super.initState();
  }

  void getListReviewer() {
    List<dynamic> responseList = REVIEWER_DATA;
    List<Widget> listStoresData = [];
    responseList.forEach((pos) {
      listStoresData.add(
        RatingCard(
          name: pos["name"],
          star: pos["star"],
          date: pos["date"],
          imageURL: pos["imageURL"],
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

  int _value = 1;
  SliverFillRemaining _buildSliverContent() {
    const cutOffDValue = 0.0;
    const dayTextStyle = TextStyle(
        fontSize: 15, color: Colors.pink, fontWeight: FontWeight.w400);
    return SliverFillRemaining(
      child: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                height: getProportionateScreenHeight(50),
                width: SizeConfig.screenWidth,
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Weekly"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Monthly"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Three month"), value: 3),
                      DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                color: Colors.white,
                height: getProportionateScreenHeight(200),
                width: SizeConfig.screenWidth,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 1),
                            FlSpot(2, 3),
                            FlSpot(3, 3),
                            FlSpot(4, 5),
                            FlSpot(4, 4)
                          ],
                          isCurved: false,
                          barWidth: 1,
                          colors: [Colors.black],
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [Colors.lightGreen.withOpacity(0.4)],
                            cutOffY: cutOffDValue,
                            applyCutOffY: true,
                          ),
                          dotData: FlDotData(
                            show: false,
                          )),
                    ],
                    minY: 0,
                    titlesData: FlTitlesData(
                        bottomTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 6,
                          getTextStyles: (value) => dayTextStyle,
                          //       getTextStyles: (value) {
                          //   final isTouched = value == touchedValue;
                          //   return TextStyle(
                          //     color: isTouched ? Colors.deepOrange : Colors.deepOrange.withOpacity(0.5),
                          //     fontWeight: FontWeight.bold,
                          //   );
                          // },
                          getTitles: (value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Mon';
                              case 1:
                                return 'Tue';
                              case 2:
                                return 'wed';
                              case 3:
                                return 'Thu';
                              case 4:
                                return 'Fri';
                              case 5:
                                return 'Sat';
                              case 6:
                                return 'Sun';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTitles: (value) {
                            return '\$ ${value + 0}';
                          },
                        )),
                    axisTitleData: FlAxisTitleData(
                        leftTitle: AxisTitle(
                            showTitle: true, titleText: 'Value', margin: 10),
                        bottomTitle: AxisTitle(
                            showTitle: true,
                            margin: 10,
                            titleText: 'Day',
                            textStyle: dayTextStyle,
                            textAlign: TextAlign.right)),
                    gridData: FlGridData(
                      show: true,
                      checkToShowHorizontalLine: (double value) {
                        return value == 1 ||
                            value == 2 ||
                            value == 3 ||
                            value == 4;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
