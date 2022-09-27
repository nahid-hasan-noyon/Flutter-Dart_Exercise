import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: [
              //* Male Card
              ReusableCard(
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: const IconContent(
                  FontAwesomeIcons.mars,
                  'Male',
                ),
                onPress: () {
                  setState(
                    () {
                      selectedGender = Gender.male;
                    },
                  );
                },
              ),
              //* Female Card
              ReusableCard(
                color: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: const IconContent(
                  FontAwesomeIcons.venus,
                  'Female',
                ),
                onPress: () {
                  setState(
                    () {
                      selectedGender = Gender.female;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        //* Height
        ReusableCard(
          color: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Height',
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
                  const Text(
                    'cm',
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: const Color(0xff8d8e98),
                  activeTrackColor: Colors.white,
                  thumbColor: const Color(0xffeb1555),
                  overlayColor: const Color(0x29eb1555),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                    value: height.toDouble(),
                    min: 120.00,
                    max: 220.00,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    }),
              ),
            ],
          ),
          onPress: () {},
        ),
        Expanded(
          child: Row(children: [
            //* Weight
            ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weight',
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
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ]),
              onPress: () {},
            ),
            //* Age
            ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
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
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ]),
              onPress: () {},
            ),
          ]),
        ),
        BottomButton(
          label: 'Calculate',
          onPress: () {
            CalculatorBrain calculatorBrain = CalculatorBrain(
              height: height,
              weight: weight,
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain.getInterpretation(),
                  ),
                ));
          },
        ),
      ]),
    );
  }
}
