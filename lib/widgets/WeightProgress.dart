import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants.dart';

class WeightProgress extends StatelessWidget {
  const WeightProgress({
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
              color: kBlueCardColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR PROGRESS',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current",
                            style: TextStyle(fontSize: 10.0),
                          ),
                          Text(
                            "64kg",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Left",
                            style: TextStyle(fontSize: 10.0),
                          ),
                          Text(
                            "16kg",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Target",
                            style: TextStyle(fontSize: 10.0),
                          ),
                          Text(
                            "50kg",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  LinearPercentIndicator(
                    lineHeight: 12.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    percent: 0.3,
                    backgroundColor: kLightBlueAsscent,
                    linearGradient:
                        LinearGradient(colors: [kBlueColor, kLightBlueColor]),
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
