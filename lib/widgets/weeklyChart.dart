import 'package:WeightLossCal/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatefulWidget {
  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.323,
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio / 0.35,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.circular(25.0)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5.0, right: 20.0, bottom: 5.0, top: 20.0),
              child: BarChart(
                BarChartData(
                  maxY: 70,
                  barGroups: getBarGroups(),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      margin: 20.0,
                      showTitles: true,
                      getTitles: getRange,
                    ),
                    bottomTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      getTitles: getWeek,
                    ),
                  ),
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [55, 40, 60, 55, 44, 67, 30];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                y: value,
                //This is not the proper way, this is just for demo
                width: 14,
                colors: [kPrimaryColor2, kPrimaryAsscent],
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
      return 'MON';
    case 1:
      return 'TUE';
    case 2:
      return 'WED';
    case 3:
      return 'THU';
    case 4:
      return 'FRI';
    case 5:
      return 'SAT';
    case 6:
      return 'SUN';
    default:
      return '';
  }
}

String getRange(double value) {
  switch (value.toInt()) {
    case 10:
      return '10';
    case 20:
      return '20';
    case 30:
      return '30';
    case 40:
      return '40';
    case 50:
      return '50';
    case 60:
      return '60';
    case 70:
      return '70';
    default:
      return '';
  }
}
