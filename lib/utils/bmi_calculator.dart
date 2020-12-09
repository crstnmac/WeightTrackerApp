import 'dart:math' as math;

enum BMIStatus { overweight, normal, underweight }

class BMICalculator {
  BMIStatus status = BMIStatus.normal;
  double points = 0;
  String text = "Normal";
  double _bmi = 0;

  void calculateBMI({double weight, double height}) {
    _bmi = weight / math.pow(height / 100, 2);
    points = _bmi;

    if (_bmi >= 25) {
      status = BMIStatus.overweight;
      text = 'Overweight';
    } else if (_bmi > 18.5) {
      status = BMIStatus.normal;
      text = 'Normal';
    } else {
      status = BMIStatus.underweight;
      text = 'Underweight';
    }
  }
}
