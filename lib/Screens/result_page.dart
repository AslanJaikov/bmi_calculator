import 'package:bmi/components/Reusable_Card.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/BottomButton.dart';

enum coloredStyle { kGreenNumber, kOrangeNumber }

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.bmiResult,
    required this.interpretation,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  coloredStyle? weightColor;

  // void coloredWeightText() {
  //   if (resultText == 'Overweight') {
  //     weightColor = coloredStyle.kOrangeNumber;
  //   }
  //   if (resultText == 'Normal') {
  //     weightColor = coloredStyle.kGreenNumber;
  //   }
  //   if (resultText == 'Underweight') {
  //     weightColor = coloredStyle.kBlueNumber;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style:
                        resultText == 'Normal' ? kGreenNumber : kOrangeNumber,
                  ),
                  Text(
                    bmiResult,
                    style: kBigResultNumber,
                  ),
                  Text(
                    interpretation,
                    style: kBmiResultText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'Re-Calculate',
            buttonFunction: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}
