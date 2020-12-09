import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants.dart';

class WeightProgress extends GetView<ProfileController> {
  final RxInt weight;
  final RxInt targetWeight;

  WeightProgress({Key key, this.weight, this.targetWeight}) : super(key: key);

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
                            controller.weight.toString() + "kg",
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
                            controller.leftWeight.toString(),
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
                            controller.targetWeight.toString() + "kg",
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
                    percent: controller.percent.toDouble(),
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
