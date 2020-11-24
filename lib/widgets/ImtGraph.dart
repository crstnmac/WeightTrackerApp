import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ImtGraph extends StatelessWidget {
  const ImtGraph({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 115,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kGreenCardColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR IMT',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "23.0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Normal",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 42.0,
                        width: 335.0,
                        child: BarChart(
                          BarChartData(
                            maxY: 1,
                            barGroups: getBarGroups(),
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: SideTitles(
                                showTitles: false,
                              ),
                              bottomTitles: SideTitles(
                                margin: 8.0,
                                showTitles: true,
                                getTitles: getWeek,
                              ),
                            ),
                            barTouchData: BarTouchData(enabled: false),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = new List<double>.generate(40, (index) => null);
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                y: 1,
                //This is not the proper way, this is just for demo
                width: 2,
                colors: i < 9
                    ? [kBlueColor]
                    : i < 28
                        ? [kGreenColor]
                        : [kRedColor],
              )
            ],
          ),
        ),
      );
  return barChartGroups;
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return '15';
    case 8:
      return '18';
    case 18:
      return '25';
    case 28:
      return '30';
    case 39:
      return '40';
    default:
      return '';
  }
}
