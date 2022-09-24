import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xff1d1e33);
const inactiveCardColor = Color(0xff111328);
const bottomContainerHeight = 60.0;
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(children: [
            ReusableCard(
                color: selectedGender == Gender.male
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: const IconContent(
                  Icons.abc,
                  'Male',
                ),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                }),
            ReusableCard(
              color: selectedGender == Gender.female
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: const IconContent(
                FontAwesomeIcons.venus,
                'Female',
              ),
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
            ),
          ]),
        ),
        // const ReusableCard(activeCardColor, Text('hi1')),
        // Expanded(
        //   child: Row(children: const [
        //     ReusableCard(activeCardColor, Text('hi2')),
        //     ReusableCard(activeCardColor, Text('hi3')),
        //   ]),
        // ),
        Container(
          color: bottomContainerColor,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
        )
      ]),
    );
  }
}
