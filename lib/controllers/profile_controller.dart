import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/screens/my_weight_screen.dart';
import 'package:WeightLossCal/utils/gender.dart';
import 'package:WeightLossCal/utils/progress_calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:WeightLossCal/utils/bmi_calculator.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static const _bmiStatusColor = {
    BMIStatus.overweight: Colors.red,
    BMIStatus.normal: kGreenCardColor,
    BMIStatus.underweight: Colors.yellow,
  };

  final gender = Gender.female.obs;
  final height = 150.obs;

  final minWeight = 30;
  final maxWeight = 150;

  final weight = 85.obs;
  final targetWeight = 75.obs;
  final age = 19.obs;

  final _calculator = BMICalculator();
  final _progress = ProgressCalculator();

  Color get resultStatusColor => _bmiStatusColor[_calculator.status];

  String get resultStatusTitle =>
      describeEnum(_calculator.status).toUpperCase();

  get resultText => _calculator.text;

  get leftWeight => _progress.result;

  get percent => _progress.percent;

  get resultPointsString => _calculator.points.toStringAsFixed(1);

  @override
  void onInit() {
    _constrainValue(weight, min: 10);
    _constrainValue(age, min: 18);
    _constrainValue(targetWeight, min: 45);
    super.onInit();
  }

  void _constrainValue(RxInt value, {int min = 0}) {
    ever(value, (_) {
      value.value = min;
    }, condition: () => value.value < min);
  }

  String get heightString => height.value.toStringAsFixed(1);

  void handleDoneTap() {
    _calculator.calculateBMI(
      height: height.value.toDouble(),
      weight: weight.value.toDouble(),
    );

    _progress.leftWeight(
      weight: weight.value.toDouble(),
      targetWeight: targetWeight.value.toDouble(),
    );
    Get.to(MyWeightScreen());
  }
}
