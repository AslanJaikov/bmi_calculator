import 'dart:math';

import 'package:bmi/constants.dart';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  double _bmi = 0;
  // double get _bmi => weight / pow(height / 100, 2);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretations() {
    if (_bmi >= 25) {
      return 'Your weight is above normal. We recommend to look into losing weight';
    } else if (_bmi > 18.5) {
      return 'Your weight is normal.';
    } else {
      return 'Your weight is below normal. We recommend to focus on diet';
    }
  }
}
