class ProgressCalculator {
  double result = 0.0;
  double percent = 0.0;

  void leftWeight({double weight, double targetWeight}) {
    result = weight - targetWeight;

    percent = (1 - ((weight - targetWeight) / 100));
  }
}
