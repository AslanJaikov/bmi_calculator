import 'package:bmi/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/components/Reusable_Card.dart';
import 'package:bmi/components/icon_content.dart';
import '../constants.dart';
import 'package:bmi/components/BottomButton.dart';
import 'package:bmi/components/RoundIconButton.dart';
import 'package:bmi/calculator_bmi.dart';

enum Genders { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

// Ternary Operator used instead of if and else operators

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void UpdateColor(Genders selectedGenders) {
  //   if (selectedGenders == Genders.Male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGenders == Genders.Female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.Male;
                      });
                    },
                    colour: selectedGender == Genders.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderWidget(
                      GenderIcon: FontAwesomeIcons.mars,
                      GenderText: 'MALE',
                      GenderIdentity: '(Assigned male at birth)',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.Female;
                      });
                    },
                    colour: selectedGender == Genders.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderWidget(
                      GenderIcon: FontAwesomeIcons.venus,
                      GenderText: 'FEMALE',
                      GenderIdentity: '(Assigned female at birth)',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height', style: kLabelStyleText),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kBigNumberStyle,
                          ),
                          Text('cm'),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 26),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 13)),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          max: 220,
                          min: 120,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  colour: kActiveCardColor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelStyleText,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconButton: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconButton: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelStyleText,
                          ),
                          Text(
                            age.toString(),
                            style: kBigNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                iconButton: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                iconButton: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor),
                ),
              ],
            )),
            BottomButton(
              buttonText: 'Calculate',
              buttonFunction: () {
                CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            interpretation: calc.getInterpretations(),
                            resultText: calc.getResults())));
              },
            )
          ],
        ));
  }
}
