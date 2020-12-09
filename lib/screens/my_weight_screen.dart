import 'package:WeightLossCal/cards/bmi_card.dart';
import 'package:WeightLossCal/cards/weight_progress.dart';
import 'package:WeightLossCal/cards/weekly_chart.dart';
import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/widgets/weight_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWeightScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          WeightInfo(
                            weight: controller.weight,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          WeeklyChart(),
                          SizedBox(
                            height: 15.0,
                          ),
                          ImtGraph(
                            height: controller.height,
                            weight: controller.weight,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          WeightProgress(
                            weight: controller.weight,
                            targetWeight: controller.weight,
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
