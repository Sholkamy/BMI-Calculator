import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_Card.dart';
import 'package:bmi_calculator/components/icon_Content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Male, Famale }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        colour: selectedGender == Gender.Male
                            ? kActiveCardColour
                            : kInActiveCardColour,
                        cardChild: IconContent(
                          iconName: FontAwesomeIcons.mars,
                          icomText: 'MALE',
                        ),
                        toDo: () {
                          setState(() => selectedGender = Gender.Male);
                        },
                      ),
                    ),
                    Expanded(
                        child: ReuseableCard(
                      colour: selectedGender == Gender.Famale
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                        iconName: FontAwesomeIcons.venus,
                        icomText: 'FEMALE',
                      ),
                      toDo: () {
                        setState(() => selectedGender = Gender.Famale);
                      },
                    )),
                  ],
                )),
            Expanded(
                flex: 3,
                child: ReuseableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            trackHeight: 3.0,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kSubtextColour,
                            thumbColor: kBottomContainerColour,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0)),
                        child: Slider(
                            value: height.toDouble(),
                            max: 220,
                            min: 120,
                            onChanged: (double newValue) {
                              setState(() => height = newValue.round());
                            }),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                        child: ReuseableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  toDo: () {
                                    setState(() => weight--);
                                  }),
                              SizedBox(
                                width: 8.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  toDo: () {
                                    setState(() => weight++);
                                  }),
                            ],
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: ReuseableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  toDo: () {
                                    setState(() => age--);
                                  }),
                              SizedBox(
                                width: 8.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  toDo: () {
                                    setState(() => age++);
                                  }),
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              toDo: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}
